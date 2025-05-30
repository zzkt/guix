;; via https://gitlab.inria.fr/guix-hpc/guix-hpc/-/blob/master/inria/julia.scm
;; and https://codeberg.org/cdegroot/guix/

(define-module (zzkt packages julia)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module ((guix search-paths) #:select ($SSL_CERT_FILE))
  #:use-module (gnu packages)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages libunwind)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages multiprecision) ; mpfr
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wget)
  #:use-module (ice-9 match))

(define-public julia
  (package
    (name "julia")
    (version "1.11.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/JuliaLang/julia/releases/download/v"
                    version "/julia-" version "-full.tar.gz"))
              (sha256
               (base32
                "09f6q9sq7p7x973lvqzs95k812fn90mcvdicc6vbz1v8dgdjcxhl"))))
    (build-system gnu-build-system)
    (arguments
     `(#:test-target "test"
       #:modules ((ice-9 match)
                  (guix build gnu-build-system)
                  (guix build utils))

       ;; The test suite takes many times longer than building and
       ;; can easily fail on smaller machines when they run out of memory.
       #:tests? ,(not (or (%current-target-system)
                          (target-aarch64?)))

       ;; Do not strip binaries to keep support for full backtraces.
       ;; See https://github.com/JuliaLang/julia/issues/17831
       #:strip-binaries? #f

       ;; The DSOs use $ORIGIN to refer to each other, but (guix build
       ;; gremlin) doesn't support it yet, so skip this phase.
       #:validate-runpath? #f

       ;; FIXME remove once things are working, but this makes
       ;; it much easier to debug.
       #:parallel-build? #f

       #:phases
       (modify-phases %standard-phases
         (delete 'configure)

         ;; Extract before we patch more. This will fail, as not every
         ;; dependency has an extract- target, but it will do the job
         ;; of extracting everything before we continue patching.
         ;; To ignore the failure, we use `system*` instead of `invoke`.
         (add-before 'patch-generated-file-shebangs 'unpack-deps
           (lambda _ (system* "make" "VERBOSE=1" "USE_BINARYBUILDER=0" "-k" "-C" "deps" "extract")))

         (add-before 'check 'set-home
<           ;; Some tests require a home directory to be set.
           (lambda _ (setenv "HOME" "/tmp")))

         (add-before 'build 'replace-default-shell
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "base/client.jl"
               (("/bin/sh") (search-input-file inputs "/bin/sh")))))

         (add-before 'build 'use-ssl-cert-file
           (lambda _
             ;; We must adapt MozillaCACerts to use SSL_CERT_FILE.
             (substitute* "stdlib/MozillaCACerts_jll/src/MozillaCACerts_jll.jl"
               (("global cacert = .*")
                (string-append
                 "global cacert = get(ENV, \"SSL_CERT_FILE\","
                 ;; our fallback location.
                 "\"/etc/ssl/certs/ca-certificates.crt\")\n")))))

         (add-after 'unpack 'enable-parallel-tests
           (lambda* (#:key parallel-tests? #:allow-other-keys)
             (when parallel-tests?
               (setenv "JULIA_TEST_USE_MULTIPLE_WORKERS" "true"))))

         (add-after 'install 'make-wrapper
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin"))
                    (program "julia"))
               (with-directory-excursion bin
                 (wrap-program program
                   `("JULIA_LOAD_PATH" ":" prefix
                     ("" "$JULIA_LOAD_PATH"))
                   `("JULIA_DEPOT_PATH" ":" prefix
                     ("" "$JULIA_DEPOT_PATH"))))))))

       #:make-flags
       (list
        "VERBOSE=1"
        (string-append "CONFIG_SHELL=" (search-input-file %build-inputs "/bin/sh"))
        "USE_BINARYBUILDER=0"

        ;; TODO - use all the packages we can from Guix instead of bundled
        ;; with Julia.
        "USE_SYSTEM_LLVM=1"

        (string-append "prefix=" (assoc-ref %outputs "out"))

        ;; Passing the MARCH or JULIA_CPU_TARGET flag is necessary to build
        ;; binary substitutes for the supported architectures.  See also
        ;; https://docs.julialang.org/en/v1/devdocs/sysimg/#Specifying-multiple-system-image-targets
        ,(match (or (%current-target-system)
                    (%current-system))
           ("x86_64-linux"
            ;; These are the flags that upstream uses for their binaries.
            "JULIA_CPU_TARGET=generic;sandybridge,-xsaveopt,clone_all;haswell,-rdrnd,base(1);x86-64-v4,-rdrnd,base(1)")
           ("i686-linux" "MARCH=pentium4")
           ("aarch64-linux" "JULIA_CPU_TARGET=generic;cortex-a57;thunderx2t99;carmel,clone_all;apple-m1,base(3);neoverse-512tvb,base(3)")
           ("armhf-linux" "JULIA_CPU_TARGET=armv7-a,neon")
           ("powerpc64le-linux" "JULIA_CPU_TARGET=pwr8")
           ;; Prevent errors when querying this package on unsupported
           ;; platforms, e.g. when running "guix package --search="
           ;; and also of targeting the builder's architecture.
           (_ "JULIA_CPU_TARGET=generic"))
        )))

    (inputs
     `(("bash-minimal" ,bash-minimal)
       ("coreutils" ,coreutils) ; for bindings to "mkdir" and the like
       ("curl" ,curl-ssh)
       ("gfortran" ,gfortran)
       ;; required for libgcc_s.so
       ("gfortran:lib" ,gfortran "lib")
       ("which" ,which)
       ("zlib" ,zlib)))

    (native-inputs
     `(("openssl" ,openssl)
       ("perl" ,perl)
       ("cmake" ,cmake)
       ("llvm" ,llvm-16)
       ("patchelf" ,patchelf)
       ("pkg-config" ,pkg-config)
       ("python" ,python)))

    (native-search-paths
      (list (search-path-specification
              (variable "JULIA_LOAD_PATH")
              (files (list "share/julia/loadpath/")))
            (search-path-specification
              (variable "JULIA_DEPOT_PATH")
              (files (list "share/julia/")))
            $SSL_CERT_FILE))

    ;; Julia only officially supports some of our platforms:
    ;; https://julialang.org/downloads/#supported_platforms
    (supported-systems '("i686-linux" "x86_64-linux" "aarch64-linux"))
    (home-page "https://julialang.org/")
    (synopsis "High-performance dynamic language for technical computing")
    (description
     "Julia is a high-level, high-performance dynamic programming language for
technical computing, with syntax that is familiar to users of other technical
computing environments.  It provides a sophisticated compiler, distributed
parallel execution, numerical accuracy, and an extensive mathematical function
library.")
    (license license:expat)))
