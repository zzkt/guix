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

;; as seen near gnu/packages/fonts.scm

(define-module (zzkt packages fonts-osp)
  #:use-module (ice-9 regex)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system font))

;; http://osp.kitchen/foundry

;; - [ ] ax-28-script
;; - [ ] belogodor
;; - [ ] certegeska
;; - [ ] cimatics
;; - [ ] cowboy-henk
;; - [ ] dlf
;; - [ ] erbarre
;; - [ ] le-patin-helvete
;; - [ ] limousine
;; - [ ] logisoso
;; - [ ] metadin
;; - [ ] mill
;; - [ ] notcouriersans
;; - [ ] philibert
;; - [ ] polsku
;; - [ ] sans-guilt-wafer
;; - [ ] skeleton
;; - [ ] ume
;; - [ ] vj12
;; - [ ] w-droge

;; - [x] alfphabet
;; - [x] belgica-belgika
;; - [x] crickx
;; - [x] fluxisch-else
;; - [x] libertinage
;; - [x] osp-din
;; - [x] reglo
;; - [x] sans-guilt
;; - [x] work-avec


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
            (url "https://gitlab.constantvzw.org/osp/foundry.libertinage")
            (commit "")))
      (sha256
       (base32
        "10bv9kksmbsi1zf0gylywgxch6sp8c2pkyn1y6c3vs1ivhfjn9m5"))))
    (build-system font-build-system)
    (home-page "http://osp.kitchen/foundry/libertinage/")
    (synopsis "A font made by copying and pasting parts of Linux Libertine glyphs.")
    (description "The Libertinage font-set we developed for the FLOSS+Art book. It was built by copying and pasting parts of Linux Libertine glyphs or simply by all-turning glyphs. There are 27 variations, one for each letter of the Latin alphabet and the ‘Full’ version, containing all modifications.")
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
            (url "https://gitlab.constantvzw.org/osp/foundry.fluxisch-else")
            (commit "")))
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
            (url "https://gitlab.constantvzw.org/osp/foundry.sans-guilt")
            (commit "")))
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
            (url "https://gitlab.constantvzw.org/osp/foundry.work-avec")
            (commit "")))
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
            (url "https://gitlab.constantvzw.org/osp/foundry.crickx")
            (commit "")))
      (sha256
       (base32
        "06ifsydmk90fzlkvzb3ij7lzsvdiamd05s1i33fa1mk6x84a9wpz"))))
    (build-system font-build-system)
    (home-page "http://osp.kitchen/foundry/crickx/")
    (synopsis "A digital reinterpretation of a set of adhesive letters.")
    (description "The Publi Fluor shop was situated in the northern part of Brussels, Schaerbeek, and founded by the father of Madame Christelle Crickx who was a trained letter painter. Starting to cut letters with the rounded and skilled cardboard templates drawn by her father, Madame Crickx slowly morphs the shapes by analysing how typographic niceties confuse her non-trained clients and leads to bad letters placement. She progressively removes the optical compensation of rounded tops and bottoms, straightens sides, and attaches accents for less floating parts. Those moves add a very specific orientation to this otherwise quite common bold italic sans serif display typeface.")
    (license license:silofl1.1)))


;; http://osp.kitchen/foundry/osp-din/
;; https://gitlab.constantvzw.org/osp/foundry.osp-din

(define-public font-osp-din
  (package
    (name "font-osp-din")
    (version "1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://gitlab.constantvzw.org/osp/foundry.osp-din")
            (commit "")))
      (sha256
       (base32
        "08lmli9l0nbcb8mhbrd458zkzm3ni29cljzkihyq438bq5v6lzxh"))))
    (build-system font-build-system)
    (home-page "http://osp.kitchen/foundry/osp-din/")
    (synopsis "A DIN font based on the original 1932 drawings.")
    (description "The first cut of OSP-DIN was drawn for the festival Cinema du réel 2009, when we were invited to work on a cartographic version of the programme. We drew the first cut of the open source DIN from grid based drawings similar to the original 1932 drawings of the DIN we saw during our investigative trip to Berlin in February 2008.")
    (license license:silofl1.1)))


;; http://osp.kitchen/foundry/reglo/

(define-public font-osp-reglo
  (package
    (name "font-osp-reglo")
    (version "1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://gitlab.constantvzw.org/osp/foundry.reglo")
            (commit "")))
      (sha256
       (base32
        "0kk6k038pfmddz53js3r1dlhib5cv9mar27vcd772r1dadagb71j"))))
    (build-system font-build-system)
    (home-page "http://osp.kitchen/foundry/reglo")
    (synopsis "Reglo is a font so tough that you can seriously mistreat it.")
    (description "Reglo is a font so tough that you can seriously mistreat it. The font was designed by Sebastien Sanfilippo in autumn 2009 and is used for Radio Panik identity.")
    (license license:silofl1.1)))


;; http://osp.kitchen/foundry/alfphabet/

(define-public font-osp-alfphabet
  (package
    (name "font-osp-alfphabet")
    (version "1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://gitlab.constantvzw.org/osp/foundry.alfphabet")
            (commit "")))
      (sha256
       (base32
        "0xb08k470hca23lvs700316qmjn83gsp5znhmhbjfwk0vvbjq5x9"))))
    (build-system font-build-system)
    (home-page "http://osp.kitchen/foundry/alfphabet")
    (synopsis "The Alfphabet family is based on the Belgian road signage lettering.")
    (description "The Alfphabet family is based on the Belgian road signage lettering called ‘Alphabet’ in French and ‘Alfabet’ in Dutch.")
    (license license:silofl1.1)))


;; http://osp.kitchen/foundry/belgica-belgika/

(define-public font-osp-belgica-belgika
  (package
    (name "font-osp-belgica-belgika")
    (version "1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://gitlab.constantvzw.org/osp/foundry.belgica-belgika")
            (commit "")))
      (sha256
       (base32
        "1mrkrrcqf16jz1y1q4avkpp6zhsmwc07aj46ssag5dyn97kcsary"))))
    (build-system font-build-system)
    (home-page "http://osp.kitchen/foundry/belgica-belgika")
    (synopsis "Stroke fonts with no contrast and capital letters only based on diverse pseudo-generic elements for multi-usages.")
    (description "Stroke fonts with no contrast and capital letters only based on diverse pseudo-generic elements for multi-usages.")
    (license license:silofl1.1)))