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

(define-module (zzkt plugdata)
  #:use-module (guix)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages gawk))

(define-public plugdata
  (package
   (name "plugdata")
   (version "0.8.2")
   (source
    (origin
     (method url-fetch)
     (uri "https://github.com/plugdata-team/plugdata/archive/refs/tags/v0.8.2.tar.gz")
     (sha256 (base32 "18c340hnx1sny87dby8wahijl1ssj1av67ff232gfwymfra6rdxm"))))
   ;; see https://github.com/juce-framework/JUCE/blob/master/docs/Linux%20Dependencies.md
   (inputs
    (list gawk))
   (build-system cmake-build-system)
   (arguments (list #:configure-flags #~(list "--enable-silent-rules")))
   (home-page "https://plugdata.org/")
   (synopsis "A visual programming environment for audio experimentation, prototyping and education")
   (description "A visual programming environment for audio experimentation, prototyping and education")
   (license license:gpl3+)))
