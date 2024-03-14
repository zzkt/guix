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
  #:use-module (ice-9 regex)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (gnu packages algebra) ;; fftw
  #:use-module (gnu packages xorg) ;; libxt
  #:use-module (gnu packages audio) ;; mainline supercollider package
  #:use-module (gnu packages readline)
  #:use-module (gnu packages linux) ;; alsa-lib, eudev
  #:use-module (gnu packages avahi)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages serialization) ;; yaml-cpp
  #:use-module (gnu packages python)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio) ;; libsndfile
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system trivial))


(define-public supercollider-cli
  (package
   (name "supercollider-cli")
   (version "3.13.0")
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
      (base32
       "1dkpnaly4m2j41ypy7xj5m2yhbl4ykw3vbnam345z4dk6qhyj9b1"))
     (modules '((guix build utils)
                (ice-9 ftw)))
     (snippet
      ;; The build system doesn't allow us to unbundle the following
      ;; libraries.  hidapi is also heavily patched and upstream not
      ;; actively maintained.
      #~(let ((keep-dirs '("nova-simd" "nova-tt" "hidapi"
                           "TLSF-2.4.6" "oscpack_1_1_0" "." "..")))
          (with-directory-excursion "./external_libraries"
                                    (for-each
                                     delete-file-recursively
                                     (scandir "."
                                              (lambda (x)
                                                (and (eq? (stat:type (stat x)) 'directory)
                                                     (not (member (basename x) keep-dirs)))))))
          ;; To find the Guix provided ableton-link library.
          (substitute* "lang/CMakeLists.txt"
                       (("include\\(\\.\\./external_libraries/link/\
AbletonLinkConfig\\.cmake\\)")
                        "find_package(AbletonLink NAMES AbletonLink ableton-link \
link REQUIRED)"))))))
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
             "-DSC_QT=OFF"  ;; CLI only. buiild without Qt and IDE
             "-DCMAKE_BUILD_TYPE=Release")
     #:phases
     #~(modify-phases %standard-phases
                      ;; HOME must be defined otherwise supercollider throws a "ERROR:
                      ;; Primitive '_FileMkDir' failed." error when generating the doc.
                      ;; The graphical tests also hang without it.
                      (add-after 'unpack 'set-home-directory
                                 (lambda _
                                   (setenv "HOME" (getcwd))))
                      (add-after 'unpack 'patch-scclass-dir
                                 (lambda _
                                   (let* ((scclass-dir
                                           (string-append #$output
                                                          "/share/SuperCollider/SCClassLibrary")))
                                     (substitute* "lang/LangSource/SC_LanguageConfig.cpp"
                                                  (((string-append
                                                     "SC_Filesystem::instance\\(\\)\\.getDirectory"
                                                     "\\(DirName::Resource\\) / CLASS_LIB_DIR_NAME"))
                                                   (string-append "Path(\"" scclass-dir "\")"))))))
                      (add-after 'patch-scclass-dir 'fix-struct-SOUNDFILE-tag
                                 (lambda _
                                   (display (getcwd)) (newline)
                                   (substitute* "include/plugin_interface/SC_SndBuf.h"
                                                (("SNDFILE_tag")
                                                 "sf_private_tag")))))))
   (native-inputs
    (list ableton-link pkg-config))
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
   (synopsis "Synthesis engine and programming language (CLI version without Qt GUI)")
   (description "SuperCollider is a synthesis engine (@code{scsynth} or
@code{supernova}) and programming language (@code{sclang}).  It can be used
for experimenting with sound synthesis and algorithmic composition.

SuperCollider requires jackd to be installed in your user profile and your
user must be allowed to access the realtime features of the kernel.  Search
for \"realtime\" in the index of the Guix manual to learn how to achieve this
using Guix System.")
   (license license:gpl2+)))


(define-public supercollider-gui
  (package
   (inherit supercollider-cli)
   (name "supercollider-gui")
   (outputs
    '("out"
      "ide"))
   (arguments
    (list
     #:configure-flags
     #~(list "-DSYSTEM_BOOST=ON"
             "-DSYSTEM_YAMLCPP=ON"
             "-DSC_QT=ON"
             "-DCMAKE_BUILD_TYPE=Release"
             "-DFORTIFY=ON"
             "-DLIBSCSYNTH=ON"
             "-DSC_EL=OFF")
     #:phases
     #~(modify-phases %standard-phases
                      ;; HOME must be defined otherwise supercollider throws a "ERROR:
                      ;; Primitive '_FileMkDir' failed." error when generating the doc.
                      ;; The graphical tests also hang without it.
                      (add-after 'unpack 'set-home-directory
                                 (lambda _
                                   (setenv "HOME" (getcwd))))
                      (add-after 'unpack 'patch-scclass-dir
                                 (lambda _
                                   (let* ((scclass-dir
                                           (string-append #$output
                                                          "/share/SuperCollider/SCClassLibrary")))
                                     (substitute* "lang/LangSource/SC_LanguageConfig.cpp"
                                                  (((string-append
                                                     "SC_Filesystem::instance\\(\\)\\.getDirectory"
                                                     "\\(DirName::Resource\\) / CLASS_LIB_DIR_NAME"))
                                                   (string-append "Path(\"" scclass-dir "\")"))))))
                      (add-after 'patch-scclass-dir 'fix-struct-SOUNDFILE-tag
                                 (lambda _
                                   (display (getcwd)) (newline)
                                   (substitute* "include/plugin_interface/SC_SndBuf.h"
                                                (("SNDFILE_tag")
                                                 "sf_private_tag"))))
                      (add-before 'build 'prepare-x
                                  (lambda _
                                    (system "Xvfb &")
                                    (setenv "DISPLAY" ":0")))
                      (add-before 'install 'install-ide
                                  (lambda _
                                    (let* ((ide #$output:ide)
                                           (scide "editors/sc-ide/scide"))
                                      (install-file scide
                                                    (string-append ide "/bin"))
                                      (delete-file scide)))))))
   (native-inputs
    (list ableton-link pkg-config qttools-5 xorg-server-for-tests))
   (inputs (modify-inputs
            (package-inputs supercollider-cli)
            (prepend qtbase
                     qtdeclarative
                     qtsvg
                     qtwebchannel
                     qtwebsockets)))
   (propagated-inputs
    (list qtwebengine))
   (synopsis "Synthesis engine and programming language (including IDE)")))


;; Supercollider GUI version by default
(define-public supercollider-default
  (package
   (inherit supercollider-gui)
   (name "supercollider-default")))
