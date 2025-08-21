;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2025 nik gaffney <nik@fo.am>
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


(define-module (zzkt packages emacs-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix i18n)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system emacs)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-build))

(define-public emacs-quiet
  (package
    (name "emacs-quiet")
    (version "20230530.859")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://codeberg.org/zzkt/quiet.git")
               (commit
                 "985b56606517971330c08686c49a8d06db763f3c")))
        (sha256
          (base32
            "0141z6acdffy96ghrwghzgqnv3mypvfkgci413dfaym4z80iwqdz"))))
    (build-system emacs-build-system)
    (home-page "https://codeberg.org/zzkt/quiet")
    (synopsis
      "Disconnect from the online world for a while")
    (description
      "A simple package to disconnect from the online world for a while, possibly reconnecting later. Any interruptions or distractions which occur once the command is run are guaranteed to be local.")
    (license license:gpl3+)))



(define-public emacs-i-ching
  (package
    (name "emacs-i-ching")
    (version "20241113.1642")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://codeberg.org/zzkt/i-ching.git")
               (commit
                 "e4339cb64a97e0d04a4cb8e7183aeec4e4ae6a29")))
        (sha256
          (base32
            "08827zq4jni4bxlmjq24nbj6k2q07ks6mb47xfs2bp8hjqb0m07f"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-request))
    (home-page "https://codeberg.org/zzkt/i-ching")
    (synopsis "The Book of Changes")
    (description
      "Documentation at https://melpa.org/#/i-ching")
    (license license:gpl3+))))
