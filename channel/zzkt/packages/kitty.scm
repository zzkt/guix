;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2015-2021, 2023 Efraim Flashner <efraim@flashner.co.il>
;;; Copyright © 2016 Mckinley Olsen <mck.olsen@gmail.com>
;;; Copyright © 2016, 2017, 2019 Alex Griffin <a@ajgrf.com>
;;; Copyright © 2016 David Craven <david@craven.ch>
;;; Copyright © 2016, 2017, 2019, 2020 Ludovic Courtès <ludo@gnu.org>
;;; Copyright © 2016, 2017 José Miguel Sánchez García <jmi2k@openmailbox.org>
;;; Copyright © 2017–2022 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2017 Kei Kebreau <kkebreau@posteo.net>
;;; Copyright © 2017, 2018, 2019 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2017 Petter <petter@mykolab.ch>
;;; Copyright © 2018 Hartmut Goebel <h.goebel@crazy-compilers.com>
;;; Copyright © 2018 Arun Isaac <arunisaac@systemreboot.net>
;;; Copyright © 2018 Gabriel Hondet <gabrielhondet@gmail.com>
;;; Copyright © 2019 Rutger Helling <rhelling@mykolab.com>
;;; Copyright © 2018, 2019, 2021 Eric Bavier <bavier@posteo.net>
;;; Copyright © 2019 Julien Lepiller <julien@lepiller.eu>
;;; Copyright © 2019, 2021 Pierre Langlois <pierre.langlois@gmx.com>
;;; Copyright © 2019, 2020 Brett Gilio <brettg@gnu.org>
;;; Copyright © 2020 Jakub Kądziołka <kuba@kadziolka.net>
;;; Copyright © 2020 Valentin Ignatev <valentignatev@gmail.com>
;;; Copyright © 2020 Michael Rohleder <mike@rohleder.de>
;;; Copyright © 2020, 2021 Marius Bakke <marius@gnu.org>
;;; Copyright © 2020, 2021 Nicolas Goaziou <mail@nicolasgoaziou.fr>
;;; Copyright © 2020 Leo Famulari <leo@famulari.name>
;;; Copyright © 2020 luhux <luhux@outlook.com>
;;; Copyright © 2021 Ekaitz Zarraga <ekaitz@elenq.tech>
;;; Copyright © 2021, 2022 Raphaël Mélotte <raphael.melotte@mind.be>
;;; Copyright © 2021 ikasero <ahmed@ikasero.com>
;;; Copyright © 2021 Brice Waegeneire <brice@waegenei.re>
;;; Copyright © 2021 Solene Rapenne <solene@perso.pw>
;;; Copyright © 2021 Petr Hodina <phodina@protonmail.com>
;;; Copyright © 2021 Stefan Reichör <stefan@xsteve.at>
;;; Copyright © 2022 Felipe Balbi <balbi@kernel.org>
;;; Copyright © 2022 ( <paren@disroot.org>
;;; Copyright © 2022, 2023 jgart <jgart@dismail.de>
;;; Copyright © 2023 Aaron Covrig <aaron.covrig.us@ieee.org>
;;; Copyright © 2023 Foundation Devices, Inc. <hello@foundationdevices.com>
;;; Copyright © 2023 Zheng Junjie <873216071@qq.com>
;;; Copyright © 2023 Jaeme Sifat <jaeme@runbox.com>
;;; Copyright © 2024 nik gaffney <nik@fo.am>
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

(define-module (zzkt packages kitty)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages dlang)
  #:use-module (gnu packages digest)
  #:use-module (gnu packages docbook)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages fribidi)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages libcanberra)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages libunwind)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages man)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages perl-check)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages popt)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (srfi srfi-26))

;; via gnu/packages/terminals.scm

(define-public kitty-next
  (package
    (name "kitty-next")
    (version "0.32.1")
    (home-page "https://sw.kovidgoyal.net/kitty/")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kovidgoyal/kitty")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0gqxn2g1ws3whn6gfb6246pad9g0a656f51f0cjrgzk8xagz1rbp"))
       ;; (patches (search-patches "kitty-fix-wayland-protocols.patch"))
       (modules '((guix build utils)))
       (snippet
        '(begin
           ;; patch needed as sphinx-build is used as a python script
           ;; whereas the guix package uses a bash script launching the
           ;; python script
           (substitute* "docs/conf.py"
             (("(from kitty.constants import str_version)" kitty-imp)
              (string-append "sys.path.append(\"..\")\n" kitty-imp)))
           (substitute* "docs/Makefile"
             (("^SPHINXBUILD[[:space:]]+= (python3.*)$")
              "SPHINXBUILD = sphinx-build\n"))
           #t))))
    (build-system gnu-build-system)
    ;; required for go build/linking phase
    (modify-phases %standard-phases
                   (add-before 'check 'fix-home-directory
                               (lambda _
                                 (setenv "HOME" "/tmp"))))
                                 ;; (setenv "GOCACHE" "/tmp/.gocache")

    (native-inputs
     (list dbus
           mesa
           libxcursor
           libxi
           libxinerama
           libxkbcommon
           libxrandr
           ncurses ;; for tic command
           pkg-config
           python-sphinx
           wayland-protocols
           go-1.21))
    (inputs
     (list fontconfig
           freetype
           harfbuzz
           lcms
           libcanberra
           libpng
           python-pygments
           python-wrapper
           wayland
           openssl
           xxhash
           zlib))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)   ;no configure script
          (replace 'build
            (lambda* (#:key inputs #:allow-other-keys)
              ;; The "kitty" sub-directory must be writable prior to
              ;; configuration (e.g., un-setting updates).
              (for-each make-file-writable (find-files "kitty"))
              (invoke "python3" "setup.py" "linux-package"
                      ;; Do not phone home.
                      "--update-check-interval=0"
                      ;; Wayland backend requires EGL, which isn't
                      ;; found out-of-the-box for some reason.
                      (string-append "--egl-library="
                                     (search-input-file inputs "/lib/libEGL.so.1")))))
          (replace 'check
            (lambda* (#:key tests? #:allow-other-keys)
              (when tests?
                ;; Fix "cannot find kitty executable" error when running
                ;; tests.
                (setenv "PATH" (string-append "linux-package/bin:"
                                              (getenv "PATH")))
                (invoke "python3" "test.py"))))
          (add-before 'install 'rm-pycache
            ;; created python cache __pycache__ are non deterministic
            (lambda _
              (let ((pycaches (find-files "linux-package/"
                                          "__pycache__"
                                          #:directories? #t)))
                (for-each delete-file-recursively pycaches))))
          (replace 'install
            (lambda _
              (let* ((obin (string-append #$output "/bin"))
                     (olib (string-append #$output "/lib"))
                     (oshare (string-append #$output "/share")))
                (copy-recursively "linux-package/bin" obin)
                (copy-recursively "linux-package/share" oshare)
                (copy-recursively "linux-package/lib" olib)))))))
    (synopsis "Fast, featureful, GPU based terminal emulator")
    (description "Kitty is a fast and featureful GPU-based terminal emulator:
@itemize
@item Offloads rendering to the GPU for lower system load and buttery smooth
scrolling.  Uses threaded rendering to minimize input latency.
@item Supports all modern terminal features: graphics (images), unicode,
true-color, OpenType ligatures, mouse protocol, focus tracking, bracketed
paste and several new terminal protocol extensions.
@item Supports tiling multiple terminal windows side by side in different
layouts without needing to use an extra program like tmux.
@item Can be controlled from scripts or the shell prompt, even over SSH.
@item Has a framework for Kittens, small terminal programs that can be used to
extend kitty's functionality.  For example, they are used for Unicode input,
hints, and side-by-side diff.
@item Supports startup sessions which allow you to specify the window/tab
layout, working directories and programs to run on startup.
@item Allows you to open the scrollback buffer in a separate window using
arbitrary programs of your choice.  This is useful for browsing the history
comfortably in a pager or editor.
@end itemize")
    (license license:gpl3+)))
