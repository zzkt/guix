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


(define-module (zzkt packages python-xyz)
  #:use-module (gnu packages python-web) ;; python-requests
  #:use-module (gnu packages python-xyz) ;; python-bibtexparser
  #:use-module (gnu packages python-build) ;; python-toml
  #:use-module (gnu packages web)        ;; python-feedparser, python-httpretty
  #:use-module (gnu packages time)       ;; python-pytz, python-dateutil
  #:use-module (gnu packages check)      ;; python-pytest
  #:use-module (guix utils)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial))

;; via guix import pypi -r pyzotero

(define-public python-pyzotero
  (package
    (name "python-pyzotero")
    (version "1.5.18")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pyzotero" version))
       (sha256
        (base32 "0bx4y7wasarm7yb8kj7rsf2vzjyin78wqs1bx6gb9fh3hy2wvkj2"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-bibtexparser
                             python-feedparser
                             python-pytz
                             python-requests))
    (native-inputs (list python-httpretty
                         python-pytest
                         python-dateutil))
    (home-page "https://github.com/urschrei/pyzotero")
    (synopsis "Python wrapper for the Zotero API")
    (description "Python wrapper for the Zotero API")
    (license license:expat)))

;; via guix import pypi -r mausoleum
;; really? pytoml==0.1.13
;; also requires pyqt5

(define-public python-mausoleum
  (package
    (name "python-mausoleum")
    (version "0.10.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "mausoleum" version))
       (sha256
        (base32 "160n1i4aabzwlrjyn8vlc26acvwwx9kizp52bqy5znyz58rmbc6a"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-appdirs
                             python-click
                             python-pytoml))
    (home-page "https://github.com/mandeep/Mausoleum")
    (synopsis "A Python GUI, CLI, and wrapper for Tomb")
    (description
     "This package provides a Python GUI, CLI, and wrapper for Tomb.")
    (license #f)))


;; via guix import pypi -r amphi-etl
;; requires `https://github.com/benfred/py-spy' to be built (rust)
;; cargo install py-spy
