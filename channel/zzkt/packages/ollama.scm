
;; via https://codeberg.org/tusharhero/ollama-guix

(define-module (ollama-bin)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (nonguix build-system binary)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages base))

;; https://github.com/ollama/ollama/releases/download/v0.14.3-rc2/ollama-linux-amd64-rocm.tar.zst

(define-public ollama-linux-amd64-rocm
  (package
    (name "ollama-linux-amd64-rocm")
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

;; https://github.com/ollama/ollama/releases/download/v0.14.2/ollama-linux-amd64.tar.zst

(define-public ollama-linux-amd64
  (package
    (name "ollama-linux-amd64")
    (version "0.14.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ollama/ollama/releases/download/v" version
             "/ollama-linux-amd64.tar.zst"))
       (sha256
        (base32 "07r7856b37sj1775vjgjx3xsi4wczb8hdf4l5blkq595lzwfjnm6"))))
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
