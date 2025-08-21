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

(define-module (zzkt packages supercollider)
  
  ;; audio.scm
  
  #:use-module (ice-9 regex)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (gnu packages algebra) ;fftw
  #:use-module (gnu packages xorg) ;libxt
  #:use-module (gnu packages audio) ;mainline supercollider package
  #:use-module (gnu packages readline)
  #:use-module (gnu packages linux) ;alsa-lib, eudev
  #:use-module (gnu packages avahi)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages serialization) ;yaml-cpp
  #:use-module (gnu packages python)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio) ;libsndfile
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system trivial)

  ;; lisp-xyz.scm
  
  #:use-module (guix build-system asdf)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system emacs)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages c)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages enchant)
  #:use-module (gnu packages figlet)
  #:use-module (gnu packages file)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages kerberos)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lisp)
  #:use-module (gnu packages lisp-check)
  #:use-module (gnu packages lisp-xyz)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages mpi)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages rsync)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages statistics)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages uml)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-19))

(define-public supercollider-cli
  (package
    (name "supercollider-cli")
    (version "3.14.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/supercollider/supercollider")
             (commit (string-append "Version-" version))
             ;; for nova-simd, nova-tt, hidapi, TLSF, oscpack
             (recursive? #t)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1qp163c6mg1d8c59ar3v1yixryr1paa9bs8pkz6yd3c86qz24n0h"))
       (modules '((guix build utils)
                  (ice-9 ftw)))
       (snippet
        ;; The build system doesn't allow us to unbundle the following
        ;; libraries.  hidapi is also heavily patched and upstream not
        ;; actively maintained.
        #~(let ((keep-dirs '("nova-simd" "nova-tt"
                             "hidapi"
                             "TLSF-2.4.6"
                             "oscpack_1_1_0"
                             "."
                             "..")))
            (with-directory-excursion "./external_libraries"
              (for-each delete-file-recursively
                        (scandir "."
                                 (lambda (x)
                                   (and (eq? (stat:type (stat x))
                                             'directory)
                                        (not (member (basename x) keep-dirs)))))))
            ;; To find the Guix provided ableton-link library.
            (substitute* "lang/CMakeLists.txt"
              (("include\\(\\.\\./external_libraries/link/AbletonLinkConfig\\.cmake\\)")
               "find_package(AbletonLink NAMES AbletonLink ableton-link link REQUIRED)"))))))
    (build-system cmake-build-system)
    (outputs '("out"))
    (arguments
     (list
      #:configure-flags
      #~(list "-DSYSTEM_BOOST=ON"
              "-DSYSTEM_YAMLCPP=ON"
              "-DFORTIFY=ON"
              "-DLIBSCSYNTH=ON"
              "-DSC_EL=OFF"
              "-DSC_QT=OFF" ;CLI only. buiild without Qt and IDE
              "-DCMAKE_BUILD_TYPE=Release")
      #:modules '((guix build cmake-build-system)
                  ((guix build gnu-build-system)
                   #:prefix gnu:)
                  (guix build utils))
      #:phases
      #~(modify-phases %standard-phases
          ;; HOME must be defined otherwise supercollider throws a "ERROR:
          ;; Primitive '_FileMkDir' failed." error when generating the doc.
          ;; The graphical tests also hang without it.
          (add-after 'unpack 'set-home-directory
            (lambda _
              (setenv "HOME"
                      (getcwd))))
          (add-after 'unpack 'patch-scclass-dir
            (lambda _
              (let* ((scclass-dir (string-append #$output
                                   "/share/SuperCollider/SCClassLibrary")))
                (substitute* "lang/LangSource/SC_LanguageConfig.cpp"
                  (((string-append
                     "SC_Filesystem::instance\\(\\)\\.getDirectory"
                     "\\(DirName::Resource\\) / CLASS_LIB_DIR_NAME"))
                   (string-append "Path(\"" scclass-dir "\")"))))))
          (add-after 'patch-scclass-dir 'fix-struct-SOUNDFILE-tag
            (lambda _
              (display (getcwd))
              (newline)
              (substitute* "include/plugin_interface/SC_SndBuf.h"
                (("SNDFILE_tag")
                 "sf_private_tag")))))))
    (native-inputs (list ableton-link pkg-config))
    (inputs (list jack-1
                  libsndfile
                  fftw
                  libxt
                  readline
                  alsa-lib
                  eudev
                  avahi
                  icu4c
                  boost
                  boost-sync
                  yaml-cpp
                  python-wrapper
                  ruby))
    (home-page "https://github.com/supercollider/supercollider")
    (synopsis
     "Synthesis engine and programming language (CLI version without Qt GUI)")
    (description
     "SuperCollider is a synthesis engine (@code{scsynth} or
@code{supernova}) and programming language (@code{sclang}).  It can be used
for experimenting with sound synthesis and algorithmic composition.

SuperCollider requires jackd to be installed in your user profile and your
user must be allowed to access the realtime features of the kernel.  Search
for \"realtime\" in the index of the Guix manual to learn how to achieve this
using Guix System.")
    (license license:gpl2+)))

(define-public supercollider-gui
  (package
    (name "supercollider-gui")
    (version "3.14.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/supercollider/supercollider")
             (commit (string-append "Version-" version))
             ;; for nova-simd, nova-tt, hidapi, TLSF, oscpack
             (recursive? #t)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1qp163c6mg1d8c59ar3v1yixryr1paa9bs8pkz6yd3c86qz24n0h"))
       (modules '((guix build utils)
                  (ice-9 ftw)))
       (snippet
        ;; The build system doesn't allow us to unbundle the following
        ;; libraries.  hidapi is also heavily patched and upstream not
        ;; actively maintained.
        #~(let ((keep-dirs '("nova-simd" "nova-tt"
                             "hidapi"
                             "TLSF-2.4.6"
                             "oscpack_1_1_0"
                             "."
                             "..")))
            (with-directory-excursion "./external_libraries"
              (for-each delete-file-recursively
                        (scandir "."
                                 (lambda (x)
                                   (and (eq? (stat:type (stat x))
                                             'directory)
                                        (not (member (basename x) keep-dirs)))))))
            ;; To find the Guix provided ableton-link library.
            (substitute* "lang/CMakeLists.txt"
              (("include\\(\\.\\./external_libraries/link/AbletonLinkConfig\\.cmake\\)")
               "find_package(AbletonLink NAMES AbletonLink ableton-link link REQUIRED)"))))))
    (build-system cmake-build-system)
    (outputs '("out" ;core language
               "ide")) ;qt ide
    (arguments
     (list
      #:configure-flags
      #~(list "-DSYSTEM_BOOST=ON"
              "-DSYSTEM_YAMLCPP=ON"
              "-DSC_QT=ON"
              "-DCMAKE_BUILD_TYPE=Release"
              "-DFORTIFY=ON"
              "-DLIBSCSYNTH=ON"
              "-DSC_EL=OFF") ;scel is packaged individually as emacs-scel
      #:modules '((guix build cmake-build-system)
                  ((guix build gnu-build-system)
                   #:prefix gnu:)
                  (guix build utils))
      #:phases
      #~(modify-phases %standard-phases
          ;; HOME must be defined otherwise supercollider throws a "ERROR:
          ;; Primitive '_FileMkDir' failed." error when generating the doc.
          ;; The graphical tests also hang without it.
          (add-after 'unpack 'set-home-directory
            (lambda _
              (setenv "HOME"
                      (getcwd))))
          (add-after 'unpack 'patch-scclass-dir
            (lambda _
              (let* ((scclass-dir (string-append #$output
                                   "/share/SuperCollider/SCClassLibrary")))
                (substitute* "lang/LangSource/SC_LanguageConfig.cpp"
                  (((string-append
                     "SC_Filesystem::instance\\(\\)\\.getDirectory"
                     "\\(DirName::Resource\\) / CLASS_LIB_DIR_NAME"))
                   (string-append "Path(\"" scclass-dir "\")"))))))
          (add-after 'patch-scclass-dir 'fix-struct-SOUNDFILE-tag
            (lambda _
              (substitute* "include/plugin_interface/SC_SndBuf.h"
                (("SNDFILE_tag")
                 "sf_private_tag"))))
          (add-before 'build 'prepare-x
            (lambda _
              (system "Xvfb &")
              (setenv "DISPLAY" ":0")))
          (replace 'install
            (assoc-ref gnu:%standard-phases
                       'install))
          (add-before 'install 'install-ide
            (lambda _
              (let* ((ide #$output:ide)
                     (scide "editors/sc-ide/scide"))
                (install-file scide
                              (string-append ide "/bin"))
                (delete-file scide)))))))
    (native-inputs (list ableton-link pkg-config qttools-5
                         xorg-server-for-tests))
    (inputs (list jack-1
                  libsndfile
                  fftw
                  libxt
                  readline ;readline support for sclang's CLI
                  alsa-lib ;for sclang's MIDI interface
                  eudev ;for user interactions with devices
                  avahi ;zeroconf service discovery support
                  icu4c
                  boost
                  boost-sync
                  yaml-cpp
                  python-wrapper ;there were warnings in the build process
                  ruby ;there were warnings in the build process
                  qtbase-5
                  qtdeclarative-5
                  qtsvg-5
                  qtwebchannel-5
                  qtwebsockets-5))
    (propagated-inputs ;to get native-search-path
                       (list qtwebengine-5))
    (home-page "https://github.com/supercollider/supercollider")
    (synopsis "Synthesis engine and programming language")
    (description
     "SuperCollider is a synthesis engine (@code{scsynth} or
@code{supernova}) and programming language (@code{sclang}).  It can be used
for experimenting with sound synthesis and algorithmic composition.

SuperCollider requires jackd to be installed in your user profile and your
user must be allowed to access the realtime features of the kernel.  Search
for \"realtime\" in the index of the Guix manual to learn how to achieve this
using Guix System.")
    (license license:gpl2+)))

;; Supercollider GUI version by default
(define-public supercollider
  (package
    (inherit supercollider-gui)
    (name "supercollider")))

;; Supercollider plugins
(define-public sc3-plugins
  (let ((commit "69cd2b68a6ad3b88c23745bbfa0f76955aaf529e")
        (revision "0")
        (version "3.14.0-pre"))
    (package
      (name "sc3-plugins")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/supercollider/sc3-plugins")
               (commit commit)
               ;; for nova-simd, TLSF, stk
               (recursive? #t)))
         (sha256
          (base32 "10srxcz8bs33f7qr9lpaf4pxcw6zr2aisgv2gwpy5p9ham89hn5s"))))
      (build-system cmake-build-system)
      (arguments
       (list
        #:tests? #f
        #:configure-flags
        #~(list (string-append "-DSC_PATH="
                               #$(this-package-input "supercollider")
                               "/include/SuperCollider")
                "-DCMAKE_BUILD_TYPE=Release" "-DSUPERNOVA=ON")
        #:phases
        #~(modify-phases %standard-phases
            (add-before 'configure 'patch-supercollider-version
              (lambda* (#:key inputs #:allow-other-keys)
                (substitute* "CMakeLists.txt"
                  (("include\\(\"\\$\\{SC_PATH\\}/SCVersion.txt\"\\)")
                   (string-append "include("
                                  (search-input-file inputs
                                   "/include/SuperCollider/SCVersion.txt") ")"))))))))
      (native-inputs (list pkg-config))
      (inputs (list fftwf supercollider))
      (home-page "https://github.com/supercollider/sc3-plugins")
      (synopsis "Community plugins for SuperCollider")
      (description
       "Community collection of unit generator plugins
for @code{SuperCollider}.  An installation extends the functionality of
@code{SuperCollider} by additional UGens that run on scsynth, the
@code{SuperCollider} audio synthesis server.")
      (license license:gpl2))))

;; as seen in in lisp-xyz.scm

(define-public sbcl-cl-collider
  (let ((commit "7e0ebb0756dda0a34401abafcd5ee22e043ce4c4")
        (revision "0"))
    (package
      (name "sbcl-cl-collider")
      (version (git-version "20250818" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/byulparan/cl-collider")
               (commit commit)))
         (file-name (git-file-name "cl-collider" version))
         (sha256
          (base32 "19i8fn7l5gm9k0ypb9kpn919hv86swdq2426vg4vb2r13h49b6vm"))))
      (build-system asdf-build-system/sbcl)
      (arguments
       (list
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'patch-executables-and-paths
              (lambda* (#:key inputs #:allow-other-keys)
                (substitute* "server.lisp"
                  (("/usr/lib/SuperCollider/plugins")
                   (search-input-directory inputs "/lib/SuperCollider/plugins"))
                  ;; (("/usr/share/SuperCollider/Extensions")
                  ;; (search-input-directory
                  ;; inputs "/share/SuperCollider/Extensions"))
                  (("which scsynth")
                   (string-append "which "
                                  (search-input-file inputs "/bin/scsynth")))
                  (("jack_connect")
                   (search-input-file inputs "/bin/jack_connect"))))))))
      (inputs (list jack-1
                    supercollider
                    sbcl-alexandria
                    sbcl-bordeaux-threads
                    sbcl-cffi
                    sbcl-cl-ppcre
                    sbcl-flexi-streams
                    sbcl-ieee-floats ;sc-osc dependencies.
                    sbcl-named-readtables
                    sbcl-osc
                    sbcl-pileup
                    sbcl-simple-inferiors ;For ecl.
                    sbcl-split-sequence
                    sbcl-usocket))
      (synopsis "SuperCollider client for CommonLisp")
      (description "This package provides a SuperCollider client for
Common Lisp.")
      (home-page "https://github.com/byulparan/cl-collider/")
      (license license:public-domain))))

(define-public cl-collider
  (sbcl-package->cl-source-package sbcl-cl-collider))

(define-public ecl-cl-collider
  (sbcl-package->ecl-package sbcl-cl-collider))
