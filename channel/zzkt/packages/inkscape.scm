;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2014 John Darrington <jmd@gnu.org>
;;; Copyright © 2014, 2016 Mark H Weaver <mhw@netris.org>
;;; Copyright © 2016, 2018 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2017, 2020 Marius Bakke <mbakke@fastmail.com>
;;; Copyright © 2018 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2020, 2021, 2022 Maxim Cournoyer <maxim.cournoyer@gmail.com>
;;; Copyright © 2020 Boris A. Dekshteyn <boris.dekshteyn@gmail.com>
;;; Copyright © 2020 Ekaitz Zarraga <ekaitz@elenq.tech>
;;; Copyright © 2023 Efraim Flashner <efraim@flashner.co.il>
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

;; via https://git.savannah.gnu.org/cgit/guix.git/tree/gnu/packages/inkscape.scm


(define-module (zzkt packages inkscape)
  #:use-module (gnu packages inkscape) ;; inherit from hidden package
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (gnu packages)
  #:use-module (gnu packages aspell)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bdw-gc)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages check)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages libreoffice)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages popt)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages image)
  #:use-module (gnu packages pkg-config)
  #:use-module (srfi srfi-1))


(define-public inkscape-next
  (package
    (inherit inkscape/stable)
    (name "inkscape-next")
    (version "1.3.2")
    (source
     (origin
       (inherit (package-source inkscape/stable))
       (method url-fetch)
       (uri (string-append "https://media.inkscape.org/dl/"
                           "resources/file/"
                           "inkscape-" version ".tar.xz"))
       (sha256
        (base32 "0sq81smxwypgnp7r3wgza8w25dsz9qa8ga79sc85xzj3qi6q9lfv"))))
    (build-system cmake-build-system)
    (arguments
     (substitute-keyword-arguments (package-arguments inkscape/stable)
       ((#:phases phases)
        `(modify-phases ,phases
           (replace 'wrap-program
             ;; Ensure Python is available at runtime.
             (lambda* (#:key outputs #:allow-other-keys)
               (let ((out (assoc-ref outputs "out")))
                 (wrap-program (string-append out "/bin/inkscape")
                   `("GUIX_PYTHONPATH" prefix
                     (,(getenv "GUIX_PYTHONPATH")))
                   ;; Wrapping GDK_PIXBUF_MODULE_FILE allows Inkscape to load
                   ;; its own icons in pure environments.
                   `("GDK_PIXBUF_MODULE_FILE" =
                     (,(getenv "GDK_PIXBUF_MODULE_FILE")))))))))))
    (inputs (modify-inputs (package-inputs inkscape/stable)
              (append python-cssselect)))        ;to render qrcode
    (properties (alist-delete 'hidden? (package-properties inkscape/stable)))))
