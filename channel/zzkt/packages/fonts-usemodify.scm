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

;; see also -> https://typespecimens.xyz/

(define-module (zzkt packages fonts-usemodify)
  #:use-module (ice-9 regex)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system font))

;; fomts via https://usemodify.com/


;; https://usemodify.com/fonts/sono/

;; https://usemodify.com/fonts/violet-sans/

;; https://usemodify.com/fonts/orbit/

;; https://usemodify.com/fonts/instrument-serif/

;; https://usemodify.com/fonts/wavy/

;; https://usemodify.com/fonts/wondertype/

;; https://usemodify.com/fonts/metaaccanthis/

https://usemodify.com/fonts/version/

https://usemodify.com/fonts/hibana/

https://usemodify.com/fonts/heal-the-web/

https://usemodify.com/fonts/dinish/

https://usemodify.com/fonts/authentic-sans/


https://usemodify.com/fonts/lucette/

https://usemodify.com/fonts/aboensis/

https://usemodify.com/fonts/barlow/

https://usemodify.com/fonts/ferrite-core/

https://usemodify.com/fonts/routed-gothic-font/

https://usemodify.com/fonts/orchard-linear/

https://usemodify.com/fonts/profont/

https://usemodify.com/fonts/apl386/

https://usemodify.com/fonts/lunchtype/

https://usemodify.com/fonts/redaction/

https://usemodify.com/fonts/league-mono/

https://usemodify.com/fonts/manusquared/

https://usemodify.com/fonts/victor-mono/

https://usemodify.com/fonts/ia-writer/






;; a metapackage for all packaged fonts
(define-public font-collection-osp
  (package
    (name "font-collection-osp")
    (version "0.3")
    (source
     #f)
    (build-system trivial-build-system)
    (arguments
     '(#:builder (begin
                   (mkdir %output) #t)))
    (propagated-inputs (list font-osp-work-avec
                             font-osp-sans-guilt
                             font-osp-reglo
                             font-osp-libertinage
                             font-osp-fluxisch-else
                             font-osp-din
                             font-osp-crickx
                             font-osp-belgica-belgika
                             font-osp-alfphabet))
    (synopsis "A collection of fonts from OSP")
    (home-page "http://osp.kitchen/foundry/")
    (description
     "A collection of fonts from OSP including; work-avec, sans-guilt, reglo, libertinage, fluxisch-else, din, crickx, belgica-belgika, alfphabet")
    (license license:silofl1.1)))

;; (version source build-system description license)"

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
        (base32 "10bv9kksmbsi1zf0gylywgxch6sp8c2pkyn1y6c3vs1ivhfjn9m5"))))
    (build-system font-build-system)
    (home-page "http://osp.kitchen/foundry/libertinage/")
    (synopsis
     "A font made by copying and pasting parts of Linux Libertine glyphs.")
    (description
     "The Libertinage font-set we developed for the FLOSS+Art book. It was built by copying and pasting parts of Linux Libertine glyphs or simply by all-turning glyphs. There are 27 variations, one for each letter of the Latin alphabet and the ‘Full’ version, containing all modifications.")
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
             (commit "75abcc332cdf9083c6d50adaaf3e53725453d152")))
       (sha256
        (base32 "0nn41gnwgnydkarjv212fdspnv29qyhrd6y2pkpwy53ds1l04p8s"))))
    (build-system font-build-system)
    (home-page "http://osp.kitchen/foundry/fluxisch-else/")
    (synopsis
     "Fluxisch Else is a font obtained from cheap phototypesetting machines.")
    (description
     "Fluxisch Else is an experiment, a first attempt to escape the post ’80 era of geometrical purity that is so typical of Postscript vector based font drawing. The shapes of Fluxisch Else were obtained from scanning printed textpages that were optically composed by cheap phototypesetting machines in the sixties and seventies. Some of Fluxisch Else beautiful features are: round angles, floating baselines, erratic kerning.

More precisely in this case, George Maciunas of the Fluxus group used an IBM composer (probably a Selectric typewriter) for most of his own work, and as a former designer, for all Fluxus work. In the 1988 book ‘Fluxus Codex’, kindly given to Pierre Huyghebaert by Sylvie Eyberg, the body text is typeset in a charmingly rounded and dancing Fluxisch that seems to smile playfully at its dry swiss creator. As if it was really tempted, trying to provide a beautiful warm up to this old modernist classical.")
    (license license:silofl1.1)))

;; http://osp.kitchen/foundry/sans-guilt/
;; https://gitlab.constantvzw.org/osp/foundry.sans-guilt
;; https://gitlab.constantvzw.org/osp/foundry.sans-guilt/-/blob/master/osp.foundry.sansguilt.zip
;; 0dajyw7x67kc8b1anrf1w1jm7w8s793jd93gy08rdiclhadp1yyq

(define-public font-osp-sans-guilt
  (package
    (name "font-osp-sans-guilt")
    (version "1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.constantvzw.org/osp/foundry.sans-guilt")
             (commit "738f04f611b13a7e1f1833c1b29c17307530de5d")))
       (sha256
        (base32 "0nn41gnwgnydkarjv212fdspnv29qyhrd6y2pkpwy53ds1l04p8s"))))
    (build-system font-build-system)
    (home-page "http://osp.kitchen/foundry/sans-guilt/")
    (synopsis "Three versions of Gill Sans based on three different sources")
    (description
     "Sans Guilt MB: Based on a rasterized pdf made with the Monotype Gill Sans delivered with Mac OSX.

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
             (commit "1feaf402adc8e5b5743c2613cecb22fb1fb86505")))
       (sha256
        (base32 "06ifsydmk90fzlkvzb3ij7lzsvdiamd05s1i33fa1mk6x84a9wpz"))))
    (build-system font-build-system)
    (home-page "http://osp.kitchen/foundry/work-avec/")
    (synopsis "A schoolbook version of the Work Sans font")
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
             (commit "b32fb9627c887be02e36271b70e1e29178611312")))
       (sha256
        (base32 "06ifsydmk90fzlkvzb3ij7lzsvdiamd05s1i33fa1mk6x84a9wpz"))))
    (build-system font-build-system)
    (home-page "http://osp.kitchen/foundry/crickx/")
    (synopsis "A digital reinterpretation of a set of adhesive letters")
    (description
     "The Publi Fluor shop was situated in the northern part of Brussels, Schaerbeek, and founded by the father of Madame Christelle Crickx who was a trained letter painter. Starting to cut letters with the rounded and skilled cardboard templates drawn by her father, Madame Crickx slowly morphs the shapes by analysing how typographic niceties confuse her non-trained clients and leads to bad letters placement. She progressively removes the optical compensation of rounded tops and bottoms, straightens sides, and attaches accents for less floating parts. Those moves add a very specific orientation to this otherwise quite common bold italic sans serif display typeface.")
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
             (commit "dc97c1ed86860351ae52a5636fa9c9a42ff93a8f")))
       (sha256
        (base32 "08lmli9l0nbcb8mhbrd458zkzm3ni29cljzkihyq438bq5v6lzxh"))))
    (build-system font-build-system)
    (home-page "http://osp.kitchen/foundry/osp-din/")
    (synopsis "A DIN font based on the original 1932 drawings")
    (description
     "The first cut of OSP-DIN was drawn for the festival Cinema du réel 2009, when we were invited to work on a cartographic version of the programme. We drew the first cut of the open source DIN from grid based drawings similar to the original 1932 drawings of the DIN we saw during our investigative trip to Berlin in February 2008.")
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
             (commit "803694439ca14a3f2806c7347d198ed6201e8c4b")))
       (sha256
        (base32 "0kk6k038pfmddz53js3r1dlhib5cv9mar27vcd772r1dadagb71j"))))
    (build-system font-build-system)
    (home-page "http://osp.kitchen/foundry/reglo")
    (synopsis "Reglo is a font so tough that you can seriously mistreat it")
    (description
     "Reglo is a font so tough that you can seriously mistreat it. The font was designed by Sebastien Sanfilippo in autumn 2009 and is used for Radio Panik identity.")
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
             (commit "83c57d32b356826723bfe4f1a9db2301b8c5b9a6")))
       (sha256
        (base32 "0xb08k470hca23lvs700316qmjn83gsp5znhmhbjfwk0vvbjq5x9"))))
    (build-system font-build-system)
    (home-page "http://osp.kitchen/foundry/alfphabet")
    (synopsis
     "The Alfphabet family is based on the Belgian road signage lettering")
    (description
     "The Alfphabet family is based on the Belgian road signage lettering called ‘Alphabet’ in French and ‘Alfabet’ in Dutch.")
    (license license:silofl1.1)))

;; http://osp.kitchen/foundry/belgica-belgika/

;; https://gitlab.constantvzw.org/osp/foundry.belgica-belgika/-/archive/master/foundry.belgica-belgika-master.zip
;; 0c5ilf59f70fwyl5rcvqs8q1cicv5v7rhrvsj24vqsfd3ig9x1c1
(define-public font-osp-belgica-belgika
  (package
    (name "font-osp-belgica-belgika")
    (version "1")
    (source
     (origin
       (method url-fetch)
       (uri "https://gitlab.constantvzw.org/osp/foundry.belgica-belgika/-/archive/master/foundry.belgica-belgika-master.zip")
       (sha256
        (base32 "0c5ilf59f70fwyl5rcvqs8q1cicv5v7rhrvsj24vqsfd3ig9x1c1"))))
    (build-system font-build-system)
    (home-page "http://osp.kitchen/foundry/belgica-belgika")
    (synopsis
     "Stroke fonts with no contrast and capital letters only based on diverse pseudo-generic elements for multi-usages")
    (description
     "Stroke fonts with no contrast and capital letters only based on diverse pseudo-generic elements for multi-usages.")
    (license license:silofl1.1)))


;; http://osp.kitchen/api/osp.foundry.belgica-belgika/ecfd91b1bb7800040d352413f27abb8cd3c92538/blob-data/belgika-5th-webfont.ttf

;; 0jr01j9nigc3nhghn47lwfq6lpyviyri2x5rdfpn28b8b1ghkz6r

;; (define-public font-osp-belgica-belgika-5th
;;   (package
;;    (name "font-osp-belgica-belgika-5th")
;;    (version "1")
;;    (source
;;     (origin
;;      (method url-fetch)
;;      (uri  "http://osp.kitchen/api/osp.foundry.belgica-belgika/ecfd91b1bb7800040d352413f27abb8cd3c92538/blob-data/belgika-5th-webfont.ttf")
;;      (sha256
;;       (base32
;;        "0jr01j9nigc3nhghn47lwfq6lpyviyri2x5rdfpn28b8b1ghkz6r"))))
;;    (build-system font-build-system)
;;    (home-page "http://osp.kitchen/foundry/belgica-belgika")
;;    (synopsis "Stroke fonts with no contrast and capital letters only based on diverse pseudo-generic elements for multi-usages.")
;;    (description "Stroke fonts with no contrast and capital letters only based on diverse pseudo-generic elements for multi-usages.")
;;    (license license:silofl1.1)))

;; http://osp.kitchen/api/osp.foundry.belgica-belgika/d0c4a6eb6e0b3618b77ebe92743b8517f5368814/blob-data/belgika-8th-webfont.ttf
;; 0q61r98377hbr5c5s0bl5xrskriqw26wasfdgz56x4qwgi85qiz9

;; (define-public font-osp-belgica-belgika-8th
;;   (package
;;    (name "font-osp-belgica-belgika-8th")
;;    (version "1")
;;    (source
;;     (origin
;;      (method url-fetch)
;;      (uri  "http://osp.kitchen/api/osp.foundry.belgica-belgika/d0c4a6eb6e0b3618b77ebe92743b8517f5368814/blob-data/belgika-8th-webfont.ttf")
;;      (sha256
;;       (base32
;;        "0q61r98377hbr5c5s0bl5xrskriqw26wasfdgz56x4qwgi85qiz9"))))
;;    (build-system font-build-system)
;;    (home-page "http://osp.kitchen/foundry/belgica-belgika")
;;    (synopsis "Stroke fonts with no contrast and capital letters only based on diverse pseudo-generic elements for multi-usages.")
;;    (description "Stroke fonts with no contrast and capital letters only based on diverse pseudo-generic elements for multi-usages.")
;;    (license license:silofl1.1)))

;; http://osp.kitchen/api/osp.foundry.belgica-belgika/5260b4052c63c359739ddd024428633bfbea3c4f/blob-data/belgika-16th-webfont.ttf
;; 1qdh1hn3a5vhsz0v4n4f48gghsjzl051x348y71zmc236nspzm9b

;; (define-public font-osp-belgica-belgika-16th
;;   (package
;;    (name "font-osp-belgica-belgika-16th")
;;    (version "1")
;;    (source
;;     (origin
;;      (method url-fetch)
;;      (uri  "http://osp.kitchen/api/osp.foundry.belgica-belgika/5260b4052c63c359739ddd024428633bfbea3c4f/blob-data/belgika-16th-webfont.ttf")
;;      (sha256
;;       (base32
;;        "1qdh1hn3a5vhsz0v4n4f48gghsjzl051x348y71zmc236nspzm9b"))))
;;    (build-system font-build-system)
;;    (home-page "http://osp.kitchen/foundry/belgica-belgika")
;;    (synopsis "Stroke fonts with no contrast and capital letters only based on diverse pseudo-generic elements for multi-usages.")
;;    (description "Stroke fonts with no contrast and capital letters only based on diverse pseudo-generic elements for multi-usages.")
;;    (license license:silofl1.1)))

;; http://osp.kitchen/api/osp.foundry.belgica-belgika/772c8b28b82269ac022fceee3ec04fc8fb166c3c/blob-data/belgika-40th-webfont.ttf
;; 15sf5yj9g6kpjjhd7aj0cg0wi8rv40b0wah9ckgn4470la8n7via

;; (define-public font-osp-belgica-belgika-40th
;;   (package
;;    (name "font-osp-belgica-belgika-40th")
;;    (version "1")
;;    (source
;;     (origin
;;      (method url-fetch)
;;      (uri  "http://osp.kitchen/api/osp.foundry.belgica-belgika/772c8b28b82269ac022fceee3ec04fc8fb166c3c/blob-data/belgika-40th-webfont.ttf")
;;      (sha256
;;       (base32
;;        "15sf5yj9g6kpjjhd7aj0cg0wi8rv40b0wah9ckgn4470la8n7via"))))
;;    (build-system font-build-system)
;;    (home-page "http://osp.kitchen/foundry/belgica-belgika")
;;    (synopsis "Stroke fonts with no contrast and capital letters only based on diverse pseudo-generic elements for multi-usages.")
;;    (description "Stroke fonts with no contrast and capital letters only based on diverse pseudo-generic elements for multi-usages.")
;;    (license license:silofl1.1)))


;; what remains...

;; https://gitlab.constantvzw.org/osp/foundry.ax-28-script

;; https://gitlab.constantvzw.org/osp/foundry.belogodor

;; https://gitlab.constantvzw.org/osp/foundry.certegeska

;; https://gitlab.constantvzw.org/osp/foundry.cimatics

;; https://gitlab.constantvzw.org/osp/foundry.cowboy-henk

;; https://gitlab.constantvzw.org/osp/foundry.erbarre

;; https://gitlab.constantvzw.org/osp/foundry.le-patin-helvete

;; https://gitlab.constantvzw.org/osp/foundry.limousine

;; https://gitlab.constantvzw.org/osp/foundry.logisoso

;; https://gitlab.constantvzw.org/osp/foundry.metadin

;; https://gitlab.constantvzw.org/osp/foundry.mill

;; https://gitlab.constantvzw.org/osp/foundry.notcouriersans

;; https://gitlab.constantvzw.org/osp/foundry.philibert

;; https://gitlab.constantvzw.org/osp/foundry.polsku

;; https://gitlab.constantvzw.org/osp/foundry.sans-guilt-wafer

;; https://gitlab.constantvzw.org/osp/foundry.ume

;; https://gitlab.constantvzw.org/osp/foundry.vj12

;; https://gitlab.constantvzw.org/osp/foundry.w-droge
