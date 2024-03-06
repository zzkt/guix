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


;; from the guix-science channel -> https://github.com/guix-science/
;; seems to have been deleted or moved?

;; see also
;; - https://github.com/guix-science/guix-science/issues/24
;; - https://github.com/guix-science/guix-science/pull/27

;; or via flatpack? https://flathub.org/apps/org.zotero.Zotero


(define-module (zzkt packages zotero)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix download)
  #:use-module (gnu packages base)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages glib)
  ;; #:use-module (nonguix build-system binary) ;; requires guix/guile path config?
  #:use-module (ice-9 regex))

(define-public zotero
  (package
    (name "zotero")
    (version "6.0.26")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://download.zotero.org/client/release/"
                           version "/Zotero-" version "_linux-x86_64.tar.bz2"))
       (sha256
        (base32 "0h1bizcqlk22h7nvhnyp3ppymv2hrk7133hgmp15hl3bvfzz7nh6"))))
    (build-system binary-build-system)
    (arguments
     `(#:patchelf-plan `(("zotero-bin" ("gcc:lib" "glibc"))
                         ("libmozgtk.so" ("gtk+"))
                         ("libxul.so" ("libx11" "dbus-glib" "libxt"
                                       "libgthread")))
       #:install-plan '(("./" "/opt/zotero/"))
       #:phases (modify-phases %standard-phases
                  (add-after 'patch-usr-bin-file 'patch-launcher
                    (lambda* (#:key outputs #:allow-other-keys)
                      (substitute* "zotero"
                        ((,(regexp-quote
                                         "$(dirname \"$(readlink -f \"$0\")\")"))
                         (string-append (assoc-ref outputs "out")
                                        "/opt/zotero")))))
                  (add-after 'install 'install-bin
                    (lambda* (#:key outputs #:allow-other-keys)
                      (mkdir-p (string-append (assoc-ref outputs "out") "/bin"))
                      (symlink (string-append (assoc-ref outputs "out")
                                              "/opt/zotero/zotero")
                               (string-append (assoc-ref outputs "out")
                                              "/bin/zotero"))
                      (mkdir-p (string-append (assoc-ref outputs "out")
                                              "/share/applications"))
                      (symlink (string-append (assoc-ref outputs "out")
                                              "/opt/zotero/zotero.desktop")
                               (string-append (assoc-ref outputs "out")
                                "/share/applications/zotero.desktop")))))))

(inputs (list coreutils
                gcc
                gtk+
                libx11
                 glib
                libxt
                dbus-glib))
   (synopsis
    "Your personal research assistant.")
   (description
    "Zotero is a free, easy-to-use tool to help you collect, organize, annotate, cite, and share research.")
   (home-page "https://www.zotero.org/")
   (license license:gpl3)))
