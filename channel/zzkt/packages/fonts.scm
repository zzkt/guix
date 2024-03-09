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

;; as seen near gnu/packages/fonts.scm

(define-module (zzkt packages fonts)
  #:use-module (ice-9 regex)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system font)
  #:use-module (guix build-system trivial))

;; various fonts & foundries

;; https://github.com/dharmatype/Bebas-Neue

(define-public font-monaspace
  (package
    (name "font-monaspace")
    (version "1.000")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://github.com/githubnext/monaspace/archive/refs/tags/v1.000.tar.gz")
       (sha256
        (base32 "0lg5qwml3fv58xk92sgamxg3rni7am2m6xzzj8pcq758idiphs8d"))))
    (build-system font-build-system)
    (home-page "https://monaspace.githubnext.com")
    (synopsis "An innovative superfamily of fonts for code")
    (description
     "The Monaspace type system is a monospaced type superfamily with some modern tricks up its sleeve. It consists of five variable axis typefaces. Each one has a distinct voice, but they are all metrics-compatible with one another, allowing you to mix and match them for a more expressive typographical palette.")
    (license license:silofl1.1)))


(define-public font-paragon
  (package
    (name "font-paragon")
    (version "1")
    (source
     (origin
       (method url-fetch)
       (uri "https://fonderiz.fr/site/assets/files/1021/paragon.zip")
       (sha256
        (base32 "1wymrz64v03gqlc110m64blg99s2hi52hi1cbs4a6h4shm54k4kq"))))
    (build-system font-build-system)
    (home-page "https://fonderiz.fr/paragon/")
    (synopsis "Revival of Paragon, one of the typefaces in Griffith's 'Legibility Group'")
    (description
     "Paragon is a serif font family, a revival of the typeface designed in 1935 by Chauncey H. Griffith for Linotype. A set of characters intended to be printed in small size on newspapers and to remain legible despite poor quality printing. The Paragon was intended to be lighter in order to compensate for the over-inking of the newspapers during printing.

The a.c.r version was designed taking as its origins the work of Phil Baines on his 'You Can Read Me' type. It seeks to establish a border where the character resists machine reading (OCR) while being readable by humans on short texts.

Designed by Cédric Rossignol Brunet")
    (license license:silofl1.1)))
