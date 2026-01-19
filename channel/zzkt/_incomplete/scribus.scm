;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2015, 2018, 2023 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2016 Efraim Flashner <efraim@flashner.co.il>
;;; Copyright © 2017, 2018, 2021, 2022 Nicolas Goaziou <mail@nicolasgoaziou.fr>
;;; Copyright © 2018 Clément Lassieur <clement@lassieur.org>
;;; Copyright © 2019 Marius Bakke <mbakke@fastmail.com>
;;; Copyright © 2020, 2021 Tobias Geerinckx-Rice <me@tobias.gr>
;;;
;;; This file is (not yet) part of GNU Guix.
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

;; Scribus 1.6.1 is availale in mainline Guix as of
;;  https://git.savannah.gnu.org/cgit/guix.git/commit/?id=3da49b1472919a62df1fe399638f23a246aa325d

(define-module (zzkt packages scribus)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix build-system cmake)
  #:use-module (gnu packages)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages hunspell)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages image)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages libreoffice)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages xml))

(define-public scribus-next
  (package
    (name "scribus-next")
    (version "1.6.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://sourceforge.net/projects/scribus/files/scribus/1.6.1/scribus-1.6.1.tar.gz")
       (sha256
        (base32 "1kqqffx5xz35mwd422s4i110794zzx9sc2bn2mg77rz02hrxdhxg"))))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #f ;no test target
       #:configure-flags '("-DWANT_GRAPHICSMAGICK=1" "-DWANT_CPP17=ON")))
    (inputs (list boost
                  cairo
                  cups
                  fontconfig
                  freetype
                  graphicsmagick
                  harfbuzz
                  hunspell
                  icu4c
                  lcms
                  libcdr
                  libfreehand
                  libjpeg-turbo
                  libmspub
                  libpagemaker
                  librevenge
                  libtiff
                  libvisio
                  libxml2
                  libzmf
                  openssl
                  podofo
                  poppler
                  python
                  qtbase-5
                  qtdeclarative-5
                  zlib))
    (native-inputs (list pkg-config qttools-5 util-linux))
    (home-page "https://www.scribus.net")
    (synopsis "Desktop publishing and page layout program")
    (description
     "Scribus is a @dfn{desktop publishing} (DTP) application and can
be used for many tasks; from brochure design to newspapers, magazines,
newsletters and posters to technical documentation.  Scribus supports
professional DTP features, such as CMYK color and a color management
system to soft proof images for high quality color printing, flexible
PDF creation options, Encapsulated PostScript import/export and
creation of four color separations, import of EPS/PS and SVG as native
vector graphics, Unicode text including right to left scripts such as
Arabic and Hebrew via FreeType.")
    (license license:gpl2+)))
