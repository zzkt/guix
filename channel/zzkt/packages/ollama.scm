
;; via https://codeberg.org/tusharhero/ollama-guix

(define-module (zzkt packages ollama)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (nonguix build-system binary)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages base))

;; https://github.com/ollama/ollama/releases/download/v0.14.3-rc2/ollama-linux-amd64-rocm.tar.zst

;; requires (?)
;; - rocminfo
;; - rocm-device-libs
;; - rocm-opencl-runtime
;; - amd-smi

(define-public ollama-rocm
  (package
    (name "ollama-rocm")
    (version "0.14.3-rc2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ollama/ollama/releases/download/v" version
             "/ollama-linux-amd64-rocm.tar.zst"))
       (sha256
        (base32 "0d1h76q40f03npkbg7b0i6gqrwyb2f4mg5mahl7mmbh1j8q7dfy7"))))
    (build-system binary-build-system)
    (supported-systems (list "x86_64-linux"))
    ;; (arguments
    ;;  `(#:strip-binaries? #f
    ;;    #:patchelf-plan `(("ollama" ("glibc" "gcc")))
    ;;    #:install-plan `(("ollama" "bin/ollama"))
    ;;    #:phases (modify-phases %standard-phases
    ;;               (add-after 'binary-unpack 'chmod-to-allow-patchelf
    ;;                 (lambda _
    ;;                   (chmod "ollama" #o755))))))
    (inputs (list (list gcc "lib") glibc))
    (home-page "https://ollama.com")
    (synopsis "Get up and running with large language models")
    (description
     "Get up and running with large language models.
Run Llama 2, Code Llama, and other models. Customize and create your own.")
    (license license:expat)))

;; v0.14.2 (stable)
;; https://github.com/ollama/ollama/releases/download/v0.14.2/ollama-linux-amd64.tar.zst
;; 07r7856b37sj1775vjgjx3xsi4wczb8hdf4l5blkq595lzwfjnm6

;; v0.14.3 (pre-release)
;; https://github.com/ollama/ollama/releases/download/v0.14.3-rc2/ollama-linux-amd64.tar.zst
;; 1xbd4cjsvv6wq16368rww9pr50zwj9fpcm72dhdr1j0rj9c3z3p3

(define-public ollama
  (package
    (name "ollama")
    (version "0.14.3-rc2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ollama/ollama/releases/download/v" version
             "/ollama-linux-amd64.tar.zst"))
       (sha256
        (base32 "1xbd4cjsvv6wq16368rww9pr50zwj9fpcm72dhdr1j0rj9c3z3p3"))))
    (build-system binary-build-system)
    (supported-systems (list "x86_64-linux"))
    (arguments
     `(#:strip-binaries? #f
       #:patchelf-plan `(("ollama" ("glibc" "gcc")))
       #:install-plan `(("ollama" "bin/ollama"))
       #:phases (modify-phases %standard-phases
                  (add-after 'binary-unpack 'chmod-to-allow-patchelf
                    (lambda _
                      (chmod "ollama" #o755))))))
    (inputs (list (list gcc "lib") glibc))
    (home-page "https://ollama.com")
    (synopsis "Get up and running with large language models")
    (description
     "Get up and running with large language models.
Run Llama 2, Code Llama, and other models. Customize and create your own.")
    (license license:expat)))
