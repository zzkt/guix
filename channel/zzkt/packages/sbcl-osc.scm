;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2023 nik gaffney <nik@fo.am>
;;;
;;; This file is not (yet) part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (zzkt packages sbcl-osc)
  #:use-module (guix)
  #:use-module (guix build-system asdf)
  #:use-module (gnu packages lisp-xyz)
  #:use-module (guix git-download)
  #:use-module ((guix licenses)
                #:prefix license:))

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
         (sha256
          (base32 "1x4cavspaxcr604g0hwak1ncy4m9cqq03ji4v56g2h1443n7h48a"))))
     (build-system asdf-build-system/sbcl)
     (native-inputs (list sbcl-fiveam))
     (inputs (list sbcl-ieee-floats))
     (synopsis "Implementation of the Open Sound Control protocol")
     (description "This is a lisp implementation of the Open Sound Control protocol (or more accurately “data transport specification” or “encoding”).  The code should be close to ANSI standard common lisp and provides self contained code for encoding and decoding of OSC data, messages, and bundles.")
     (home-page "https://github.com/zzkt/osc/")
     (license license:gpl3+))))

(define-public cl-osc
  (sbcl-package->cl-source-package sbcl-osc))

(define-public ecl-osc
  (sbcl-package->ecl-package sbcl-osc))
