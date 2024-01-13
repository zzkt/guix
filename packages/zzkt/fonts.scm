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

(define-module (zzkt fonts)
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

;; https://guix.gnu.org/manual/en/html_node/Fonts.html

;; The name of a package containing only one font family starts with font-
;; it is followed by the foundry name and a dash - if the foundry is known,
;; and the font family name, in which spaces are replaced by dashes (and as
;; usual, all upper case letters are transformed to lower case).
;; For example, the Gentium font family by SIL is packaged under the name font-sil-gentium.

;; For a package containing several font families, the name of the collection
;; is used in the place of the font family name. For instance, the Liberation
;; fonts consist of three families, Liberation Sans, Liberation Serif and
;; Liberation Mono. These could be packaged separately under the names font-liberation-sans
;; and so on, but as they are distributed together under a common name, we prefer to
;; package them together as font-liberation.

;; guix package -s font | recsel -p name,synopsis

;; guix package -i fontconfig
;; fc-cache -rv

;; various foundries

;; https://velvetyne.fr/

;; https://velvetyne.fr/fonts/degheest/
;; https://velvetyne.fr/fonts/fungal/
;; https://velvetyne.fr/fonts/sligoil/
;; https://velvetyne.fr/fonts/outward/
;; https://velvetyne.fr/fonts/karrik/
;; https://velvetyne.fr/fonts/cirruscumulus/
;; https://velvetyne.fr/fonts/le-murmure/
;; https://velvetyne.fr/fonts/resistance/
;; https://velvetyne.fr/fonts/gulax/
;; https://velvetyne.fr/fonts/lineal/


;; font-velvetyne-degheest
;; font-velvetyne-fungal
;; font-velvetyne-sligoil
;; font-velvetyne-outward
;; font-velvetyne-karrik
;; font-velvetyne-cirruscumulus
;; font-velvetyne-le-murmure
;; font-velvetyne-resistance
;; font-velvetyne-gulax
;; font-velvetyne-lineal

;; https://velvetyne.fr/fonts/bianzhidai/
;; https://github.com/sdfggvfvj/bianzhidai-2.0

(define-public font-velvetyne-bianzhidai
  (package
    (name "font-velvetyne-bianzhidai")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/sdfggvfvj/bianzhidai-2.0/archive/refs/tags/OFL.tar.gz")
              (sha256
               (base32
                "0p6bbvy3m474h57wm3nlg6zz94f3y2d6mhiawmlgg8zbny26kjl2"))))
    (build-system font-build-system)
    (home-page "https://velvetyne.fr/fonts/bianzhidai/")
    (synopsis "BianZhiDai is a font inspired by shading characters in ASCII art and woven plastic bags.")
    (description "BianZhiDai is a font inspired by shading characters in ASCII art and 编织袋 (woven plastic bag in Simple Chinese). BianZhiDai is good with colors, especially in combination with different fill/stroke colors. Try it, and play it. Besides, the whole font is modular based, so you can customize it in Glyphs any way you like.")
    (license license:silofl1.1)))

;; OSP
;;  http://osp.kitchen/foundry/

;; http://osp.kitchen/foundry/libertinage/
;; https://gitlab.constantvzw.org/osp/foundry.libertinage

;; http://osp.kitchen/foundry/fluxisch-else/
;; https://gitlab.constantvzw.org/osp/foundry.fluxisch-else

;; http://osp.kitchen/foundry/sans-guilt/
;; https://gitlab.constantvzw.org/osp/foundry.sans-guilt

;; not your type
;;  https://notyourtype.nl/typefaces/



;; other / misc

;; https://github.com/dharmatype/Bebas-Neue

;; https://github.com/undercasetype/Fraunces

;; https://github.com/ryanoasis/nerd-fonts

;; https://github.com/be5invis/Iosevka

;; https://github.com/githubnext/monaspace

;; https://github.com/uswds/public-sans

;; https://github.com/arrowtype/recursive



;; testing and/or example
(define-public font-artifika
  (package
    (name "font-artifika")
    (version "1.102")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cyrealtype/Artifika")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0nwjm44nys1qz3wyg0mm15gdjpz641xpmsz00n6m8065xrw86q7i"))))
    (build-system font-build-system)
    (home-page "https://github.com/cyrealtype/Artifika")
    (synopsis "Upright italic font")
    (description "Artifika is an upright italic font for fashionable display
titling.")
    (license license:silofl1.1)))
