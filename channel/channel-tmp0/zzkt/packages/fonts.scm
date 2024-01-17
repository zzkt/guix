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

;; as seen near  gnu/packages/fonts.scm

(define-module (zzkt packages fonts)
  #:use-module (ice-9 regex)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages c)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gd)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages xorg))

;; various foundries

;; velvetyne -> see fonts-velvetyne.scm
;; OSP -> see fonts-OSP.scm

;; not your type
;;  https://notyourtype.nl/typefaces/


;; other / misc

;; https://github.com/dharmatype/Bebas-Neue

;; https://github.com/undercasetype/Fraunces

;; https://github.com/ryanoasis/nerd-fonts

;; https://github.com/githubnext/monaspace

(define-public font-monaspace
  (package
   (name "font-monaspace")
   (version "1.000")
   (source (origin
            (method url-fetch)
            (uri "https://github.com/githubnext/monaspace/archive/refs/tags/v1.000.tar.gz")
           (sha256
            (base32
             "0lg5qwml3fv58xk92sgamxg3rni7am2m6xzzj8pcq758idiphs8d"))))
   (build-system font-build-system)
   (home-page "https://monaspace.githubnext.com")
   (synopsis "An innovative superfamily of fonts for code.")
   (description "The Monaspace type system is a monospaced type superfamily with some modern tricks up its sleeve. It consists of five variable axis typefaces. Each one has a distinct voice, but they are all metrics-compatible with one another, allowing you to mix and match them for a more expressive typographical palette.")
   (license license:silofl1.1)))

;; https://github.com/uswds/public-sans

;; https://github.com/arrowtype/recursive


;; testing and/or example

;; (define-public font-artifika
;;   (package
;;    (name "font-artifika")
;;    (version "1.102")
;;    (source (origin
;;             (method git-fetch)
;;             (uri (git-reference
;;                   (url "https://github.com/cyrealtype/Artifika")
;;                   (commit (string-append "v" version))))
;;             (file-name (git-file-name name version))
;;             (sha256
;;              (base32
;;               "0nwjm44nys1qz3wyg0mm15gdjpz641xpmsz00n6m8065xrw86q7i"))))
;;    (build-system font-build-system)
;;    (home-page "https://github.com/cyrealtype/Artifika")
;;    (synopsis "Upright italic font")
;;    (description "Artifika is an upright italic font for fashionable display
;; titling.")
;;    (license license:silofl1.1)))
