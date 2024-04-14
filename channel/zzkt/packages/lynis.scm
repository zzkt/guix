;;; GNU Guix --- Functional package management for G->NU
;;; Copyright © 2012-2024 Ludovic Courtès <ludo@gnu.org>
;;; Copyright © 2013 Cyril Roelandt <tipecaml@gmail.com>
;;; Copyright © 2014, 2015, 2016, 2018, 2019, 2020 Mark H Weaver <mhw@netris.org>
;;; Copyright © 2014, 2015-2018, 2020-2023 Eric Bavier <bavier@posteo.net>
;;; Copyright © 2015, 2016 Taylan Ulrich Bayırlı/Kammer <taylanbayirli@gmail.com>
;;; Copyright © 2015 Alex Sassmannshausen <alex.sassmannshausen@gmail.com>
;;; Copyright © 2015 Eric Dvorsak <eric@dvorsak.fr>
;;; Copyright © 2016, 2017, 2020 Leo Famulari <leo@famulari.name>
;;; Copyright © 2016 Pjotr Prins <pjotr.guix@thebird.nl>
;;; Copyright © 2016, 2017, 2023 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2016-2023 Efraim Flashner <efraim@flashner.co.il>
;;; Copyright © 2016 Peter Feigl <peter.feigl@nexoid.at>
;;; Copyright © 2016 John J. Foerch <jjfoerch@earthlink.net>
;;; Copyright © 2016, 2017 Nikita <nikita@n0.is>
;;; Copyright © 2016–2022 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2016 John Darrington <jmd@gnu.org>
;;; Copyright © 2017 Ben Sturmfels <ben@sturm.com.au>
;;; Copyright © 2017 Ethan R. Jones <doubleplusgood23@gmail.com>
;;; Copyright © 2017 Christine Lemmer-Webber <cwebber@dustycloud.org>
;;; Copyright © 2017, 2018, 2020 Marius Bakke <mbakke@fastmail.com>
;;; Copyright © 2018, 2019 Arun Isaac <arunisaac@systemreboot.net>
;;; Copyright © 2018 Pierre-Antoine Rouby <pierre-antoine.rouby@inria.fr>
;;; Copyright © 2018 Rutger Helling <rhelling@mykolab.com>
;;; Copyright © 2018 Pierre Neidhardt <mail@ambrevar.xyz>
;;; Copyright © 2019 Brett Gilio <brettg@gnu.org>
;;; Copyright © 2019,2020 Björn Höfling <bjoern.hoefling@bjoernhoefling.de>
;;; Copyright © 2019 Jakob L. Kreuze <zerodaysfordays@sdf.org>
;;; Copyright © 2019 Hartmut Goebel <h.goebel@crazy-compilers.com>
;;; Copyright © 2019 Alex Griffin <a@ajgrf.com>
;;; Copyright © 2019, 2021, 2022 Guillaume Le Vaillant <glv@posteo.net>
;;; Copyright © 2019, 2020, 2021 Mathieu Othacehe <m.othacehe@gmail.com>
;;; Copyright © 2020 Oleg Pykhalov <go.wigust@gmail.com>
;;; Copyright © 2020, 2023 Janneke Nieuwenhuizen <janneke@gnu.org>
;;; Copyright © 2020, 2021, 2022 Michael Rohleder <mike@rohleder.de>
;;; Copyright © 2020 Vincent Legoll <vincent.legoll@gmail.com>
;;; Copyright © 2020 Morgan Smith <Morgan.J.Smith@outlook.com>
;;; Copyright © 2021, 2022, 2023 Maxim Cournoyer <maxim.cournoyer@gmail.com>
;;; Copyright © 2021, 2023 Zheng Junjie <873216071@qq.com>
;;; Copyright © 2021 Stefan Reichör <stefan@xsteve.at>
;;; Copyright © 2021 qblade <qblade@protonmail.com>
;;; Copyright © 2021 Hyunseok Kim <lasnesne@lagunposprasihopre.org>
;;; Copyright © 2021 David Larsson <david.larsson@selfhosted.xyz>
;;; Copyright © 2021 WinterHound <winterhound@yandex.com>
;;; Copyright © 2021 Brice Waegeneire <brice@waegenei.re>
;;; Copyright © 2021 Maxime Devos <maximedevos@telenet.be>
;;; Copyright © 2021 muradm <mail@muradm.net>
;;; Copyright © 2021 pineapples <guixuser6392@protonmail.com>
;;; Copyright © 2021 Petr Hodina <phodina@protonmail.com>
;;; Copyright © 2021 Artyom V. Poptsov <poptsov.artyom@gmail.com>
;;; Copyright © 2022 Wamm K. D. <jaft.r@outlook.com>
;;; Copyright © 2022 Roman Riabenko <roman@riabenko.com>
;;; Copyright © 2022 Petr Hodina <phodina@protonmail.com>
;;; Copyright © 2022 Andreas Rammhold <andreas@rammhold.de>
;;; Copyright © 2022 ( <paren@disroot.org>
;;; Copyright © 2022, 2023 Matthew James Kraai <kraai@ftbfs.org>
;;; Copyright © 2022 jgart <jgart@dismail.de>
;;; Copyright © 2023 Juliana Sims <juli@incana.org>
;;; Copyright © 2023 Lu Hui <luhux76@gmail.com>
;;; Copyright © 2023 Yovan Naumovski <yovan@gorski.stream>
;;; Copyright © 2023 Alexey Abramov <levenson@mmer.org>
;;; Copyright © 2023 Bruno Victal <mirai@makinata.eu>
;;; Copyright © 2023 Tobias Kortkamp <tobias.kortkamp@gmail.com>
;;; Copyright © 2023 Jaeme Sifat <jaeme@runbox.com>
;;; Copyright © 2023 Nicolas Graves <ngraves@ngraves.fr>
;;; Copyright © 2023 Tomás Ortín Fernández <tomasortin@mailbox.org>
;;; Copyright © 2024 dan <i@dan.games>
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

;; as seen near
;;  https://git.savannah.gnu.org/cgit/guix.git/tree/gnu/packages/admin.scm#n4740


;; lynis 3.1.1
;; https://github.com/CISOfy/lynis/commit/60afce6d8110ee9e88ac9e9d0e0346b1cf222b5e

;; lynis-sdk 3.1.1
;; https://github.com/CISOfy/lynis-sdk/commit/f4f885f1f049f59940487a6ffc2d53806c729d12

(define-module (zzkt packages lynis)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system emacs)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system qt)
  #:use-module (guix build-system ruby)
  #:use-module (guix build-system trivial)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix platform)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages acl)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages attr)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages c)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-windows)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages cryptsetup)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages cyrus-sasl)
  #:use-module (gnu packages datastructures)
  #:use-module (gnu packages dns)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages file)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages golang-build)
  #:use-module (gnu packages golang-compression)
  #:use-module (gnu packages golang-xyz)
  #:use-module (gnu packages groff)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages guile-xyz)
  #:use-module (gnu packages image)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages inkscape)
  #:use-module (gnu packages kerberos)
  #:use-module (gnu packages libbsd)
  #:use-module (gnu packages libunwind)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages m4)
  #:use-module (gnu packages mail)
  #:use-module (gnu packages man)
  #:use-module (gnu packages mcrypt)
  #:use-module (gnu packages mpi)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages nettle)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages openldap)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages patchutils)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages perl-check)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages polkit)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages selinux)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages time)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg))


(define-public lynis
  (package
    (name "lynis")
    ;; Also update the ‘lynis-sdk’ input to the commit matching this release.
    (version "3.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/CISOfy/lynis")
             (commit "60afce6d8110ee9e88ac9e9d0e0346b1cf222b5e")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "05bh16i916xz9w8p8fz8flzj9ayyzg7wpbi7q61ylrlahhc03nqd"))
       (modules '((guix build utils)))
       (snippet
        '(begin
           ;; Remove proprietary plugins. As of now, all plugins supplied with
           ;; lynis are proprietary. In the future, if free plugins are
           ;; provided, whitelist them from deletion.
           (for-each delete-file (find-files "plugins"))))))
    (build-system gnu-build-system)
    (native-inputs
     `(;; For tests
       ("lynis-sdk"
        ,(origin
           (method git-fetch)
           (uri (git-reference
                 (url "https://github.com/CISOfy/lynis-sdk")
                 (commit "f4f885f1f049f59940487a6ffc2d53806c729d12")))
           (file-name (git-file-name "lynis-sdk" version))
           (sha256
            (base32 "09d98wmvan7nlchm056kls5xm939d1231pwsvlp4q2aznz8cmg42"))))))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            ;; XXX Remove after fixing <https://issues.guix.gnu.org/55287>.
            (lambda* (#:key source #:allow-other-keys)
              (mkdir "source")
              (chdir "source")
              (copy-recursively source "."
                                #:keep-mtime? #t)))
          (replace 'configure
            (lambda _
              (substitute* "lynis"
                (("/usr/share/lynis")
                 (string-append #$output "/share/lynis")))
              (substitute* "include/functions"
                (("/usr/local/etc/lynis")
                 (string-append #$output "/etc/lynis")))))
          (delete 'build)
          (replace 'install
            (lambda _
              (install-file "lynis" (string-append #$output "/bin/"))
              (install-file "default.prf" (string-append #$output "/etc/lynis"))
              (for-each
               (lambda (dir)
                 (copy-recursively
                  dir (string-append #$output "/share/lynis/" dir)))
               (list "db" "include" "plugins"))
              (install-file "lynis.8"
                            (string-append #$output "/share/man/man8"))))
          (replace 'check
            (lambda _
              (copy-recursively #$(this-package-native-input "lynis-sdk")
                                "../lynis-sdk")
              (setenv "LANG" "en_US.UTF-8")
              (let ((lynis-dir (getcwd)))
                (with-directory-excursion "../lynis-sdk"
                  (substitute* "config"
                    (("\\.\\./lynis") lynis-dir))
                  (substitute* "unit-tests/tests-language-translations.sh"
                    (("\\.\\./lynis") lynis-dir))
                  (invoke "sh" "lynis-devkit" "run" "unit-tests"))))))))
    (home-page "https://cisofy.com/lynis/")
    (synopsis "Security auditing tool")
    (description "Lynis is a security auditing tool.  It performs an in-depth
security scan and runs on the system itself.  The primary goal is to test
security defenses and provide tips for further system hardening.  It will also
scan for general system information, vulnerable software packages, and
possible configuration issues.")
    (license license:gpl3+)))
