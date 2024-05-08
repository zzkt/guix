;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2024 nik gaffney <nik@fo.am>
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

;; 0xType is a type foundry specialized in programming fonts.
;;                                            https://0xtype.dev/

(define-module (zzkt packages fonts-0xProto)
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

;; a metapackage for all packaged fonts
(define-public font-collection-0xType
  (package
    (name "font-collection-0xType")
    (version "0.1")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     '(#:builder (begin
                   (mkdir %output) #t)))
    (propagated-inputs (list font-0xProto
                             font-0xPropo))
    (synopsis "A collection of fonts from 0xType")
    (home-page "https://0xtype.dev/")
    (description
     "A collection of fonts from 0xType including 0xProto and 0xPropo")
    (license license:silofl1.1)))


(define-public font-0xProto
  (package
    (name "font-0xProto")
    (version "2.000")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/0xType/0xProto/releases/download/2.000/0xProto_2_000.zip")
       (sha256
        (base32 "1l5lqvchfjhn42s5rdr74s1jzcadnd8vba8s113bbfky1ymgysgg"))))
    (build-system font-build-system)
    (home-page "https://github.com/0xType/0xProto")
    (synopsis "A programming font focused on source code legibility")
    (description
     "0xProto is a programming font focused on source code legibility. Features; clear differentiation, legibility in small font size, more whitespace, and ligatures that don't deform shape.

Designed by 0xType")
    (license license:silofl1.1)))


(define-public font-0xPropo
  (package
    (name "font-0xPropo")
    (version "1.000")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/0xType/0xPropo/releases/download/1.000/0xPropo_1_000.zip")
       (sha256
        (base32 "0mrihzffqfxxhmmgs43q5v4z8k6s4k6vcmyd3f0pr7r1fvwigfyc"))))
    (build-system font-build-system)
    (home-page "https://github.com/0xType/0xPropo")
    (synopsis "Just the proportional version of 0xProto")
    (description
     "0xPropo is a font that retains the atmosphere and beauty of a monospace font and solves some of the difficulties in using monospace fonts for writing natural language (e.g. m and H are too close together, and i and l have too much space).

Designed by 0xType")
    (license license:silofl1.1)))
