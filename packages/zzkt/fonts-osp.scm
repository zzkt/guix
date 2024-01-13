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

;; as seen near  gnu/packages/fonts.scm

(define-module (zzkt fonts)
  #:use-module (ice-9 regex)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system font))

;; http://osp.kitchen/foundry

;; - [ ] philibert
;; - [x] fluxisch-else
;; - [ ] ume
;; - [ ] erbarre
;; - [ ] belgica-belgika
;; - [ ] alfphabet
;; - [x] crickx
;; - [ ] polsku
;; - [ ] w-droge
;; - [ ] vj12
;; - [ ] sans-guilt-wafer
;; - [ ] reglo
;; - [ ] osp-din
;; - [ ] notcouriersans
;; - [ ] mill
;; - [x] libertinage
;; - [ ] le-patin-helvete
;; - [ ] cowboy-henk
;; - [ ] cimatics
;; - [ ] certegeska
;; - [ ] belogodor
;; - [ ] ax-28-script
;; - [x] work-avec
;; - [ ] metadin
;; - [ ] limousine
;; - [x] sans-guilt
;; - [ ] dlf
;; - [ ] logisoso
;; - [ ] skeleton


;; http://osp.kitchen/foundry/libertinage/
;; https://gitlab.constantvzw.org/osp/foundry.libertinage

(define-public font-osp-libertinage
  (package
    (name "font-osp-libertinage")
    (version "1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://gitlab.constantvzw.org/osp/foundry.libertinage")))
      (sha256
       (base32
        "10bv9kksmbsi1zf0gylywgxch6sp8c2pkyn1y6c3vs1ivhfjn9m5"))))
    (build-system font-build-system)
    (home-page "http://osp.kitchen/foundry/libertinage/")
    (synopsis "A font made by copying and pasting parts of Linux Libertine glyphs.")
    (description "The Libertinage font-set we developed for the FLOSS+Art book. It was built by copying and pasting parts of Linux Libertine glyphs or simply by all-turning glyphs.

There are 27 variations, one for each letter of the Latin alphabet + the ‘Full’ version, containing all modifications.

Every section of the book was assigned one font variation. The book reflects on the growing relationship between Free Software ideology, open content and digital art.")
    (license license:silofl1.1)))


;; http://osp.kitchen/foundry/fluxisch-else/
;; https://gitlab.constantvzw.org/osp/foundry.fluxisch-else

(define-public font-osp-fluxisch-else
  (package
    (name "font-osp-fluxisch-else")
    (version "1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://gitlab.constantvzw.org/osp/foundry.fluxisch-else")))
      (sha256
       (base32
        "0nn41gnwgnydkarjv212fdspnv29qyhrd6y2pkpwy53ds1l04p8s"))))
    (build-system font-build-system)
    (home-page "http://osp.kitchen/foundry/fluxisch-else/")
    (synopsis "Fluxisch Else is a font obtained from cheap phototypesetting machines.")
    (description "Fluxisch Else is an experiment, a first attempt to escape the post ’80 era of geometrical purity that is so typical of Postscript vector based font drawing. The shapes of Fluxisch Else were obtained from scanning printed textpages that were optically composed by cheap phototypesetting machines in the sixties and seventies. Some of Fluxisch Else beautiful features are: round angles, floating baselines, erratic kerning.

More precisely in this case, George Maciunas of the Fluxus group used an IBM composer (probably a Selectric typewriter) for most of his own work, and as a former designer, for all Fluxus work. In the 1988 book ‘Fluxus Codex’, kindly given to Pierre Huyghebaert by Sylvie Eyberg, the body text is typeset in a charmingly rounded and dancing Fluxisch that seems to smile playfully at its dry swiss creator. As if it was really tempted, trying to provide a beautiful warm up to this old modernist classical.")
    (license license:silofl1.1)))


;; http://osp.kitchen/foundry/sans-guilt/
;; https://gitlab.constantvzw.org/osp/foundry.sans-guilt

(define-public font-osp-sans-guilt
  (package
    (name "font-osp-sans-guilt")
    (version "1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://gitlab.constantvzw.org/osp/foundry.sans-guilt")))
      (sha256
       (base32
        "0nn41gnwgnydkarjv212fdspnv29qyhrd6y2pkpwy53ds1l04p8s"))))
    (build-system font-build-system)
    (home-page "http://osp.kitchen/foundry/sans-guilt/")
    (synopsis "Three versions of Gill Sans based on three different sources.")
    (description "Sans Guilt MB: Based on a rasterized pdf made with the Monotype Gill Sans delivered with Mac OSX.
Sans Guilt DB: Based on early sketches by Eric Gill
Sans Guilt LB: Based on lead type from Royal College of Arts letterpress workshop.")
    (license license:silofl1.1)))

;; http://osp.kitchen/foundry/work-avec/
;; https://gitlab.constantvzw.org/osp/foundry.work-avec

(define-public font-osp-work-avec
  (package
    (name "font-osp-work-avec")
    (version "1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://gitlab.constantvzw.org/osp/foundry.work-avec")))
      (sha256
       (base32
        "06ifsydmk90fzlkvzb3ij7lzsvdiamd05s1i33fa1mk6x84a9wpz"))))
    (build-system font-build-system)
    (home-page "http://osp.kitchen/foundry/work-avec/")
    (synopsis "A schoolbook version of the Work Sans font.")
    (description "A schoolbook version of the Work Sans font.")
    (license license:silofl1.1)))


;; http://osp.kitchen/foundry/crickx
;; https://gitlab.constantvzw.org/osp/foundry.crickx

(define-public font-osp-crickx
  (package
    (name "font-osp-crickx")
    (version "1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://gitlab.constantvzw.org/osp/foundry.crickx")))
      (sha256
       (base32
        "06ifsydmk90fzlkvzb3ij7lzsvdiamd05s1i33fa1mk6x84a9wpz"))))
    (build-system font-build-system)
    (home-page "http://osp.kitchen/foundry/crickx/")
    (synopsis "A digital reinterpretation of a set of adhesive letters.")
    (description "The Publi Fluor shop was situated in the northern part of Brussels, Schaerbeek, and founded by the father of Madame Christelle Crickx who was a trained letter painter. Starting to cut letters with the rounded and skilled cardboard templates drawn by her father, Madame Crickx slowly morphs the shapes by analysing how typographic niceties confuse her non-trained clients and leads to bad letters placement. She progressively removes the optical compensation of rounded tops and bottoms, straightens sides, and attaches accents for less floating parts. Those moves add a very specific orientation to this otherwise quite common bold italic sans serif display typeface.")
    (license license:silofl1.1)))
