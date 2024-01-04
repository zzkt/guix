
(define-module (zzkt sbcl-osc)
  #:use-module (guix)
  #:use-module (guix build-system asdf)
  #:use-module (gnu packages lisp-xyz)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:))

(define-public sbcl-osc
  (let ((commit "f647738ccc22925ed740a8ca9132fda76a05baeb")
	(revision "0"))
    (package
     (name "sbcl-osc")
     (version (git-version "0.9" revision commit))
     (source
      (origin
       (method git-fetch)
      	(uri (git-reference
	      (url "https://github.com/zzkt/osc")
	      (commit commit)))
	(file-name (git-file-name "cl-osc" version))
	(sha256 (base32 "1x4cavspaxcr604g0hwak1ncy4m9cqq03ji4v56g2h1443n7h48a"))))
     (build-system asdf-build-system/sbcl)
     (inputs (list sbcl-ieee-floats))
     (synopsis "Implementation of the Open Sound Control protocol")
     (description "This is a lisp implementation of the Open Sound Control protocol (or more accurately “data transport specification” or “encoding”). The code should be close to ANSI standard common lisp and provides self contained code for encoding and decoding of OSC data, messages, and bundles.")
     (home-page "https://github.com/zzkt/osc/")
     (license (list license:gpl3+)))))

(define-public cl-osc
  (sbcl-package->cl-source-package sbcl-osc))

(define-public ecl-osc
    (sbcl-package->ecl-package sbcl-osc))
