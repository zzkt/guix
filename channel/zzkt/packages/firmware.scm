;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2014, 2015, 2016 Ludovic Courtès <ludo@gnu.org>
;;; Copyright © 2016 Eric Bavier <bavier@member.fsf.org>
;;; Copyright © 2017 David Craven <david@craven.ch>
;;; Copyright © 2017, 2018 Efraim Flashner <efraim@flashner.co.il>
;;; Copyright © 2018, 2020 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2018 Vagrant Cascadian <vagrant@debian.org>
;;; Copyright © 2019 Mathieu Othacehe <m.othacehe@gmail.com>
;;; Copyright © 2020, 2021, 2022 Marius Bakke <marius@gnu.org>
;;; Copyright © 2021 Petr Hodina <phodina@protonmail.com>
;;; Copyright © 2022 Maxim Cournoyer <maxim.cournoyer@gmail.com>
;;;
;;; This file is part of GNU Guix.
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

(define-module (zzkt packages firmware)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages assembly)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cross-base)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages efi)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages hardware)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages man)
  #:use-module (gnu packages mingw)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages polkit)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xml))

(define-public fwupd
  (package
    (name "fwupd")
    (version "1.8.14")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fwupd/fwupd")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "179yc0nbbyrdya5q16ncf7lkslrhr3i90rgb9vdmv751ikilkby6"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:configure-flags #~(list "--wrap-mode=nofallback"
                                "-Dsystemd=false"
                                (string-append "-Defi_os_dir="
                                               #$gnu-efi "/lib")
                                "-Defi_binary=false"
                                (string-append "-Dudevdir="
                                               #$output "/lib/udev")
                                "--localstatedir=/var"
                                (string-append "--libexecdir="
                                               #$output "/libexec")
                                "-Dsupported_build=true"
                                ;; (don't) disable LVFS, (just) because it contains
                                ;; nonfree firmwares.
                                "-Dlvfs=enabled")
      #:glib-or-gtk? #t               ;To wrap binaries and/or compile schemas
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'make-source-writable
            (lambda _
              (for-each make-file-writable
                        (find-files "."))
              (substitute* "src/fu-self-test.c"
                (("/bin/sh")
                 (which "sh")))))
          ;; These two files are zipped by Python, so need a newer timestamp.
          (add-after 'unpack 'newer-timestamps-for-python-zip
            (lambda _
              (let ((circa-1980 (* 10 366 24 60 60)))
                (for-each (lambda (file)
                            (make-file-writable file)
                            (utime file circa-1980 circa-1980))
                          '("./libfwupdplugin/tests/colorhug/firmware.bin"
                            "./libfwupdplugin/tests/colorhug/firmware.bin.asc")))))
          (add-before 'build 'setup-home
            (lambda _
              (setenv "HOME" "/tmp")))
          (add-before 'install 'no-polkit-magic
            (lambda _
              (setenv "PKEXEC_UID" "something")))
          ;; (add-after 'install 'ensure-all-remotes-are-disabled
          ;;   ;; Because no remote currently promises to offer only free
          ;;   ;; software firmwares, disable them to prevent a user to
          ;;   ;; unknowingly install proprietary firmware updates.
          ;;   (lambda _
          ;;     (substitute* (find-files (string-append #$output "/etc")
          ;;                              "\\.conf$")
          ;;       (("Enabled=true")
          ;;        "Enabled=false"))))
          )))
    (native-inputs (list gobject-introspection
                         python-pygobject
                         python-pillow
                         python-pycairo
                         python
                         pkg-config
                         vala
                         gtk-doc
                         which
                         umockdev
                         `(,glib "bin")
                         help2man
                         gettext-minimal))
    (inputs (append
             (list bash-completion
                   libgudev
                   libxmlb
                   sqlite
                   polkit
                   eudev
                   libelf
                   tpm2-tss
                   cairo
                   efivar
                   pango
                   protobuf-c
                   mingw-w64-tools
                   gnu-efi)
             (if (supported-package? libsmbios
                                     (or (and=> (%current-target-system)
                                                platform-target->system)
                                         (%current-system)))
                 (list libsmbios)
                 '())))
    ;; In Requires of fwupd*.pc.
    (propagated-inputs (list curl
                             gcab
                             glib
                             gnutls
                             gusb
                             json-glib
                             libarchive
                             libjcat))
    (home-page "https://fwupd.org/")
    (synopsis "Daemon to allow session software to update firmware")
    (description "This package aims to make updating firmware on GNU/Linux
automatic, safe and reliable.  It is used by tools such as GNOME Software.")
    (license license:lgpl2.1+)))
