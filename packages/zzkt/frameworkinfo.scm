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
		 "0p31lfqri18mmjkd0rjwcnhc8h58mzcjvhylgzqg2sykg1xl7fri"))))
    (inputs
     (list sudo dmidecode pciutils lshw))
    (build-system python-build-system)
    (arguments
     `(#:tests? #f))
    (home-page "https://github.com/zzkt/frameworkinfo")
    (synopsis "Show hardware info for framework laptop.")
    (description "")
    (license license:gpl3+)))
