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


;; add option for cli only version -> -D SC_QT=OFF

;; maybe as variant?
;;  https://guix.gnu.org/manual/en/html_node/Defining-Package-Variants.html

;; or multiple outputs ->
;;  https://guix.gnu.org/manual/en/html_node/Packages-with-Multiple-Outputs.html

;; non GUI version of standard build can be modified via env
;; % export QT_QPA_PLATFORM=offscreen
;; % sclang

(define-module (zzkt packages supercollider)
  #:use-module (ice-9 regex)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system trivial))


;; via https://git.savannah.gnu.org/cgit/guix.git/tree/gnu/packages/audio.scm

(define-public supercollider-next
  (package
   (name "supercollider-next")
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
   (outputs
    '("out"                            ;core language
      "ide"))                          ;qt ide
   (arguments
    (list
     #:configure-flags
     #~(list "-DSYSTEM_BOOST=ON"
             "-DSYSTEM_YAMLCPP=ON"
             "-DSC_QT=ON"
             "-DCMAKE_BUILD_TYPE=Release"
             "-DFORTIFY=ON"
             "-DLIBSCSYNTH=ON"
             "-DSC_EL=OFF")      ;scel is packaged individually as emacs-scel
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
   (inputs (list jack-1
                 libsndfile
                 fftw
                 libxt
                 readline              ;readline support for sclang's CLI
                 alsa-lib              ;for sclang's MIDI interface
                 eudev                 ;for user interactions with devices
                 avahi                 ;zeroconf service discovery support
                 icu4c
                 boost
                 boost-sync
                 yaml-cpp
                 python-wrapper        ;there were warnings in the build process
                 ruby                  ;there were warnings in the build process
                 qtbase-5
                 qtdeclarative-5
                 qtsvg-5
                 qtwebchannel-5
                 qtwebsockets-5))
   (propagated-inputs                  ;to get native-search-path
    (list qtwebengine-5))
   (home-page "https://github.com/supercollider/supercollider")
   (synopsis "Synthesis engine and programming language")
   (description "SuperCollider is a synthesis engine (@code{scsynth} or
@code{supernova}) and programming language (@code{sclang}).  It can be used
for experimenting with sound synthesis and algorithmic composition.

SuperCollider requires jackd to be installed in your user profile and your
user must be allowed to access the realtime features of the kernel.  Search
for \"realtime\" in the index of the Guix manual to learn how to achieve this
using Guix System.")
   (license license:gpl2+)))

;; variants

(define-public supercollider-cli
  (package
   (name "supercollider-cli")
   (inherit supercollider)

   ;; remove qt inputs
   (inputs (modify-inputs
            (package-inputs supercollider)
            (delete "qtbase-5"
                    "qtdeclarative-5"
                    "qtsvg-5"
                    "qtwebchannel-5"
                    "qtwebsockets-5")))
   ;; use slightly modified build options
   (arguments
    (list
     #:configure-flags
     #~(list "-DSYSTEM_BOOST=ON"
             "-DSYSTEM_YAMLCPP=ON"
             ;; CLI only. buiild without Qt and IDE
             "-DSC_QT=OFF"
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
                                                 "sf_private_tag")))))))
   (synopsis "Synthesis engine and programming language. CLI version without Qt GUI")))

;; non-inherted variant

(define-public supercollider-cli-2
  (package
   (name "supercollider-cli")
   (version "3.13.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/supercollider/supercollider")
           (commit (string-append "Version-" version))
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
   (outputs
    '("out"))
   (arguments
    (list
     #:configure-flags
     #~(list "-DSYSTEM_BOOST=ON"
             "-DSYSTEM_YAMLCPP=ON"
             ;; CLI only. buiild without Qt and IDE
             "-DSC_QT=OFF"
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
                                                 "sf_private_tag")))))))
   (native-inputs
    (list ableton-link pkg-config))
   (inputs (list jack-1
                 libsndfile
                 fftw
                 libxt
                 readline              ;readline support for sclang's CLI
                 alsa-lib              ;for sclang's MIDI interface
                 eudev                 ;for user interactions with devices
                 avahi                 ;zeroconf service discovery support
                 icu4c
                 boost
                 boost-sync
                 yaml-cpp
                 python-wrapper        ;there were warnings in the build process
                 ruby))                  ;there were warnings in the build process
   (home-page "https://github.com/supercollider/supercollider")
   (synopsis "Synthesis engine and programming language. CLI version without Qt GUI")
   (description "SuperCollider is a synthesis engine (@code{scsynth} or
@code{supernova}) and programming language (@code{sclang}).  It can be used
for experimenting with sound synthesis and algorithmic composition.

SuperCollider requires jackd to be installed in your user profile and your
user must be allowed to access the realtime features of the kernel.  Search
for \"realtime\" in the index of the Guix manual to learn how to achieve this
using Guix System.")
   (license license:gpl2+)))
