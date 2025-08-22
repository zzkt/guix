;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2025 nik gaffney <nik@fo.am>
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


(define-module (zzkt packages emacs-xyz)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix i18n)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system emacs)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz) ;; emacs-request
  #:use-module (gnu packages emacs-build))

(define-public emacs-quiet
  (package
    (name "emacs-quiet")
    (version "20230530.859")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://codeberg.org/zzkt/quiet.git")
               (commit
                 "985b56606517971330c08686c49a8d06db763f3c")))
        (sha256
          (base32
            "0141z6acdffy96ghrwghzgqnv3mypvfkgci413dfaym4z80iwqdz"))))
    (build-system emacs-build-system)
    (home-page "https://codeberg.org/zzkt/quiet")
    (synopsis
      "Disconnect from the online world for a while")
    (description
      "A simple package to disconnect from the online world for a while, possibly reconnecting later. Any interruptions or distractions which occur once the command is run are guaranteed to be local.")
    (license license:gpl3+)))


(define-public emacs-i-ching
  (package
    (name "emacs-i-ching")
    (version "20241113.1642")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://codeberg.org/zzkt/i-ching.git")
               (commit
                 "e4339cb64a97e0d04a4cb8e7183aeec4e4ae6a29")))
        (sha256
          (base32
            "08827zq4jni4bxlmjq24nbj6k2q07ks6mb47xfs2bp8hjqb0m07f"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-request))
    (home-page "https://codeberg.org/zzkt/i-ching")
    (synopsis "The Book of Changes")
    (description
      "Cast hexagrams and consult the I Ching, or 'Book of Changes' from the comfort of Emacs. The I Ching can be used as a divination method, pattern generator or fixed point for millennia of commentary & exegesis. This package provides methods for casting and describing hexagrams, querying the oracle, and finding patterns in randomness. The descriptions of hexagrams and their classification have been drawn from public domain sources, tradition and antiquity.")
    (license license:gpl3+)))


(define-public emacs-aqi
  (package
    (name "emacs-aqi")
    (version "20230530.1204")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://codeberg.org/zzkt/aqi.git")
               (commit
                 "cbff3c6ce691a3a1d2f5636384e29d43f0e1d236")))
        (sha256
          (base32
            "0r87kvcdj93q61kxk1713z3rza0p1mircsadx53dj3i0f01bx3qa"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-request
                             emacs-let-alist))
    (home-page "https://codeberg.org/zzkt/aqi")
    (synopsis "Air quality data from the World Air Quality Index project.")
    (description
      "An emacs interface to the World Air Quality Index, providing air quality information from around 12,000 stations in over 100 countries and 1000 major cities")
    (license license:gpl3+)))


(define-public emacs-smog
  (package
    (name "emacs-smog")
    (version "20230530.843")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://codeberg.org/zzkt/smog.git")
               (commit
                 "2fc5fef0f5000027b3550495259a65966c68ec52")))
        (sha256
          (base32
            "1x9iwbfyvh34x3gnm7nwwl1lgsyzgs1374bf5khzif9h4wd09ffa"))))
    (build-system emacs-build-system)
    (propagated-inputs (list diction))
    (home-page "https://codeberg.org/zzkt/smog")
    (synopsis
     "Analyse the writing style, word use and readability of prose.")
    (description
      "A simple way to analyse the writing style, word use and readability of prose in Emacs. It performs several readability tests on the text including; Flesch-Kincaid readability tests, Automated Readability Index (aka 'ARI'), Coleman-Liau Index, Gunning fog index (aka 'Fog Index'), and SMOG Index (aka 'SMOG-Grading', 'Simple Measure Of Gobbledygook'). It also summarises word usage and provides information about sentence and paragraph structure.")
    (license license:gpl3+)))


;; via emacs-xyz.scm (reduce & update to 3.14.0)

;; (define-public emacs-scel
;;   (let ((version "20170629")
;;         (revision "1")
;;         (commit "aeea3ad4be9306d14c3a734a4ff54fee10ac135b"))
;;     (package
;;       (name "emacs-scel")
;;       (version (git-version version revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/supercollider/scel")
;;                (commit commit)))
;;          (file-name (git-file-name name version))
;;          (sha256
;;           (base32
;;            "0jvmzs1lsjyndqshhii2y4mnr3wghai26i3p75453zrpxpg0zvvw"))))
;;       (build-system emacs-build-system)
;;       (arguments
;;        (list
;;         #:tests? #f ; No tests.
;;         #:modules '((guix build emacs-build-system)
;;                     ((guix build cmake-build-system) #:prefix cmake:)
;;                     (guix build utils))
;;         #:imported-modules `(,@%emacs-build-system-modules
;;                              (guix build cmake-build-system))
;;         #:phases
;;         #~(modify-phases %standard-phases
;;             (add-after 'unpack 'configure
;;               (lambda* (#:key outputs #:allow-other-keys)
;;                 (substitute* "el/CMakeLists.txt"
;;                   (("share/emacs/site-lisp/SuperCollider")
;;                    (elpa-directory #$output)))
;;                 ((assoc-ref cmake:%standard-phases 'configure)
;;                  #:outputs outputs
;;                  #:configure-flags '("-DSC_EL_BYTECOMPILE=OFF"))))
;;             (add-after 'expand-load-path 'add-el-dir-to-emacs-load-path
;;               (lambda _
;;                 (setenv "EMACSLOADPATH"
;;                         (string-append (getcwd)
;;                                        "/el:"
;;                                        (getenv "EMACSLOADPATH")))))
;;             (replace 'install (assoc-ref cmake:%standard-phases 'install)))))
;;       (inputs
;;        (list supercollider))
;;       (native-inputs
;;        (list cmake-minimal))
;;       (home-page "https://github.com/supercollider/scel")
;;       (synopsis "SuperCollider Emacs interface")
;;       (description "@code{emacs-scel} is an Emacs interface to SuperCollider.
;; SuperCollider is a platform for audio synthesis and algorithmic composition.")
;;      (license license:gpl2+))))
