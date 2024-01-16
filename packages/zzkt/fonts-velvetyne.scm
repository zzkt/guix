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

;; as seen near  gnu/packages/fonts.scm

(define-module (zzkt fonts-velvetyne)
  #:use-module (ice-9 regex)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system font))


;; https://velvetyne.fr/

;; - [ ] Amdal
;; - [ ] Anthony
;; - [ ] Avara
;; - [ ] BackOut
;; - [ ] Basteleur
;; - [x] BianZhiDai
;; - [ ] CirrusCumulus
;; - [ ] Compagnon
;; - [x] Degheest
;; - [ ] Façade
;; - [ ] Format 1452
;; - [x] Fungal
;; - [ ] Grotesk
;; - [ ] Gulax
;; - [ ] Jgs font
;; - [ ] Kaeru Kaeru
;; - [ ] Karrik
;; - [ ] Le Murmure
;; - [ ] Lineal
;; - [ ] Lithops
;; - [ ] Mess
;; - [ ] Mourier
;; - [ ] Ouroboros
;; - [ ] Outward
;; - [ ] PicNic
;; - [ ] Pilowlava
;; - [ ] Sligoil
;; - [ ] TINY
;; - [ ] Typefesse
;; - [ ] VG5000


;; bianzhidai - https://velvetyne.fr/fonts/bianzhidai/

(define-public font-velvetyne-bianzhidai
  (package
   (name "font-velvetyne-bianzhidai")
   (version "2.0")
   (source (origin
            (method url-fetch)
            (uri "https://github.com/sdfggvfvj/bianzhidai-2.0/archive/refs/tags/OFL.tar.gz")
            (sha256
             (base32
              "0p6bbvy3m474h57wm3nlg6zz94f3y2d6mhiawmlgg8zbny26kjl2"))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/bianzhidai/")
   (synopsis "BianZhiDai is a font inspired by shading characters in ASCII art and woven plastic bags.")
   (description "BianZhiDai is a font inspired by shading characters in ASCII art and 编织袋 (woven plastic bag in Simple Chinese). BianZhiDai is good with colors, especially in combination with different fill/stroke colors. Try it, and play it. Besides, the whole font is modular based, so you can customize it in Glyphs any way you like.")
   (license license:silofl1.1)))


;; font-velvetyne-cirruscumulus


;; degheest family - https://velvetyne.fr/fonts/degheest/

(define-public font-velvetyne-degheest
  (package
   (name "font-velvetyne-degheest")
   (version "")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gitlab.com/Eugenie-B/degheest-types/")
           (commit "")))
     (sha256
      (base32
       "0js6h8ch9dbha2lkcmhpy5qmryzi09pjkryqzngg0kn4k2cyg1bw"))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/degheest")
   (synopsis "A font family of Ange Degheest’s remarkable typefaces and lettering work.")
   (description "After discovering Ange Degheest’s archives at the Rennes School of Fine Arts, we decided to put together an exhibition that attempted to finally give the designer the full recognition she deserves. In this exhibition, visitors learnt about Degheest’s life story and professional achievements, and discovered many original archival documents that had never previously been presented to the public. In addition to this historical research, we revived some of Ange Degheest’s most remarkable typefaces and lettering work, which are now available in digital format.

To revive means: to resurrect, to reactivate, to renew; and in many ways our work consisted in a kind of resurrection. We had indeed to reactivate the memory of Ange Degheest by diving in her archives, by exhuming the story of a woman who lived through many ages and locations. Only once we had acquired a good grasp of her life story, were we able to revive her typefaces. Reviving her designs and distributing them widely, free of charge, is our way to honour Ange Degheest’s memory and to give them a new life in the 21st century.

Deheest is a project by Ange Degheest, Eugénie Bidaut, Oriane Charvieux, Mandy Elbé, Luna Delabre, Camille Depalle, Justine Herbel, May Jolivet and Benjamin Gomez, created in Atelier de création typographique from EESAB Rennes.")
   (license license:silofl1.1)))


;; fungal - https://velvetyne.fr/fonts/fungal/

(define-public font-velvetyne-fungal
  (package
   (name "font-velvetyne-fungal")
   (version "")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gitlab.com/velvetyne/fungal/")
           (commit "")))
     (sha256
      (base32
       "0ab552f5f3fm7l7dj7jgg0klj66giwgyl1nx21rqvqdr6vf2zmch"))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/fungal")
   (synopsis "Libre variable font inspired by mycelium growth, forked from DejaVu Sans.")
   (description "In 2022, Hato press invited Raphaël Bastide to do a publication part of the zine series. In a wish to revive the “fan” part of fanzine, Raphaël Bastide decided to pay tribute to Wikipedia, a surviving, precious, unequaled place on the open WWW. The 16 pages riso print zine shows the encyclopedia’s interface as a post-human vestige, an artifact invaded by biomorphic figures and spreading typography. Through the pages of the zine, the reader discovers how the graphic elements are spreading like mycelium, creating an ornamental graphic network.

The Fungal font is a close collaboration between Jérémy Landes and Raphaël Bastide, so the characters of the zine can grow and spread thanks to their variable design. Fungal is a fork of DejaVu Sans, a libre font, popular on Linux systems.

The hypæ of the mycelium growing from each glyphs can be controlled in their length (the Grow axis) and in their thickness (the Thickness axis) allowing to fine tune the density of the rhizome growing on the page and the legibility of the text in the same move.")
   ;; Fungal is under Bitstream Vera Fonts Copyright
   (license license:silofl1.1)))


;; https://velvetyne.fr/fonts/sligoil/
;; font-velvetyne-sligoil

;; https://velvetyne.fr/fonts/outward/
;; font-velvetyne-outward

;; https://velvetyne.fr/fonts/karrik/
;; font-velvetyne-karrik

;; https://velvetyne.fr/fonts/le-murmure/
;; font-velvetyne-le-murmure

;; https://velvetyne.fr/fonts/resistance/
;; font-velvetyne-resistance

;; https://velvetyne.fr/fonts/gulax/
;; font-velvetyne-gulax

;; https://velvetyne.fr/fonts/lineal/
;; font-velvetyne-lineal
