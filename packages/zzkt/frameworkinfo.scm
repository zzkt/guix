
(define-module (zzkt frameworkinfo)
  #:use-module (guix)
  #:use-module (guix build-system python)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz))

(define-public frameworkinfo
  (package
    (name "frameworkinfo")
    (version "0.2")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/zzkt/frameworkinfo")
              (commit "endless")))
        (file-name (git-file-name name version))
        (sha256 (base32
		 "0a3k9xz48pbn3i7cw0iha6ww3gfzfb77m8q9kdwrmpm4hmal6c9c"))))
    (inputs
     (list sudo dmidecode pciutils lshw))
    (build-system python-build-system)
    (home-page "https://github.com/zzkt/frameworkinfo")
    (synopsis "Show hardware info for framework laptop.")
    (description "")
    (license license:gpl3+)))
