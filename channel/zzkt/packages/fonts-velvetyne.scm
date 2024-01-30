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

(define-module (zzkt packages fonts-velvetyne)
  #:use-module (ice-9 regex)
  #:use-module (guix utils)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system font)
  #:use-module (guix build-system trivial))


;; https://velvetyne.fr/
;;  credit line is included at the end of the package description.


;; - [ ] Anthony
;; - [ ] Avara
;; - [ ] BackOut
;; - [ ] Basteleur
;; - [ ] CirrusCumulus
;; - [ ] Compagnon
;; - [ ] Façade
;; - [ ] Grotesk
;; - [ ] Jgs font
;; - [ ] Kaeru Kaeru
;; - [ ] Mourier
;; - [ ] Ouroboros
;; - [ ] PicNic
;; - [ ] Pilowlava
;; - [ ] TINY
;; - [ ] Typefesse
;; - [ ] VG5000

;; - [ ] Mess
;; - [ ] Format 1452
;; - [ ] Trickster

;; - [x] Lithops
;; - [x] Lineal
;; - [x] Amdal
;; - [x] Gulax

;; - [x] BianZhiDai
;; - [x] Degheest
;; - [x] Fungal
;; - [x] Karrik
;; - [x] Le Murmure
;; - [x] Outward
;; - [x] Resistance
;; - [x] Sligoil

;; a metapackage for all packaged fonts
(define-public font-collection-velvetyne
  (package
    (name "font-collection-velvetyne")
    (version "0.1")
    (source
     #f)
    (build-system trivial-build-system)
    (arguments
     '(#:builder (begin
                   (mkdir %output) #t)))
    (propagated-inputs (list
                        font-velvetyne-amdal
                        font-velvetyne-bianzhidai
                        font-velvetyne-degheest
                        font-velvetyne-fungal
                        font-velvetyne-gulax
                        font-velvetyne-karrik
                        font-velvetyne-lineal
                        font-velvetyne-lithops
                        font-velvetyne-murmure
                        font-velvetyne-outward
                        font-velvetyne-resistance
                        font-velvetyne-sligoil
                        ))
    (synopsis "A collection of fonts from Velvetyne")
    (home-page "https://velvetyne.fr/")
    (description
     "A collection of fonts from Velvetyne including; amdal, bianzhidai, degheest")
    (license license:silofl1.1)))

;; bianzhidai - https://velvetyne.fr/fonts/bianzhidai/

(define-public font-velvetyne-bianzhidai
  (package
    (name "font-velvetyne-bianzhidai")
    (version "2.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://github.com/sdfggvfvj/bianzhidai-2.0/archive/refs/tags/OFL.tar.gz")
       (sha256
        (base32 "0p6bbvy3m474h57wm3nlg6zz94f3y2d6mhiawmlgg8zbny26kjl2"))))
    (build-system font-build-system)
    (home-page "https://velvetyne.fr/fonts/bianzhidai/")
    (synopsis
     "BianZhiDai is a font inspired by shading characters in ASCII art and woven plastic bags")
    (description
     "BianZhiDai is a font inspired by shading characters in ASCII art and 编织袋 (woven plastic bag in Simple Chinese). BianZhiDai is good with colors, especially in combination with different fill/stroke colors. Try it, and play it. Besides, the whole font is modular based, so you can customize it in Glyphs any way you like.")
    (license license:silofl1.1)))

;; font-velvetyne-cirruscumulus

;; degheest family - https://velvetyne.fr/fonts/degheest/

(define-public font-velvetyne-degheest
  (package
    (name "font-velvetyne-degheest")
    (version "1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/Eugenie-B/degheest-types/")
             (commit "22a7ed8a6371d98e7f8a6fdb4db74a17885ae3bf")))
       (sha256
        (base32 "0js6h8ch9dbha2lkcmhpy5qmryzi09pjkryqzngg0kn4k2cyg1bw"))))
    (build-system font-build-system)
    (home-page "https://velvetyne.fr/fonts/degheest")
    (synopsis
     "A font family of Ange Degheest’s remarkable typefaces and lettering work")
    (description
     "After discovering Ange Degheest’s archives at the Rennes School of Fine Arts, we decided to put together an exhibition that attempted to finally give the designer the full recognition she deserves. In this exhibition, visitors learnt about Degheest’s life story and professional achievements, and discovered many original archival documents that had never previously been presented to the public. In addition to this historical research, we revived some of Ange Degheest’s most remarkable typefaces and lettering work, which are now available in digital format.

To revive means: to resurrect, to reactivate, to renew; and in many ways our work consisted in a kind of resurrection. We had indeed to reactivate the memory of Ange Degheest by diving in her archives, by exhuming the story of a woman who lived through many ages and locations. Only once we had acquired a good grasp of her life story, were we able to revive her typefaces. Reviving her designs and distributing them widely, free of charge, is our way to honour Ange Degheest’s memory and to give them a new life in the 21st century.

Deheest is a project by Ange Degheest, Eugénie Bidaut, Oriane Charvieux, Mandy Elbé, Luna Delabre, Camille Depalle, Justine Herbel, May Jolivet and Benjamin Gomez, created in Atelier de création typographique from EESAB Rennes.")
    (license license:silofl1.1)))

;; fungal - https://velvetyne.fr/fonts/fungal/

(define-public font-velvetyne-fungal
  (package
    (name "font-velvetyne-fungal")
    (version "1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/velvetyne/fungal/")
             (commit "b5b58278bc903ea5f0fe015a59b07fa77e9c56ff")))
       (sha256
        (base32 "0ab552f5f3fm7l7dj7jgg0klj66giwgyl1nx21rqvqdr6vf2zmch"))))
    (build-system font-build-system)
    (home-page "https://velvetyne.fr/fonts/fungal")
    (synopsis
     "Libre variable font inspired by mycelium growth, forked from DejaVu Sans")
    (description
     "In 2022, Hato press invited Raphaël Bastide to do a publication part of the zine series. In a wish to revive the “fan” part of fanzine, Raphaël Bastide decided to pay tribute to Wikipedia, a surviving, precious, unequaled place on the open WWW. The 16 pages riso print zine shows the encyclopedia’s interface as a post-human vestige, an artifact invaded by biomorphic figures and spreading typography. Through the pages of the zine, the reader discovers how the graphic elements are spreading like mycelium, creating an ornamental graphic network.

The Fungal font is a close collaboration between Jérémy Landes and Raphaël Bastide, so the characters of the zine can grow and spread thanks to their variable design. Fungal is a fork of DejaVu Sans, a libre font, popular on Linux systems.

The hypæ of the mycelium growing from each glyphs can be controlled in their length (the Grow axis) and in their thickness (the Thickness axis) allowing to fine tune the density of the rhizome growing on the page and the legibility of the text in the same move.

Fungal by Raphaël Bastide, Jérémy Landes. Distributed by velvetyne.fr")
    ;; Fungal is under Bitstream Vera Fonts Copyright
    (license license:silofl1.1)))


;; sligoil - https://velvetyne.fr/fonts/sligoil/

(define-public font-velvetyne-sligoil
  (package
    (name "font-velvetyne-sligoil")
    (version "1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/velvetyne/sligoil")
             (commit "2e60a0fa31685a64fcc7b6e9854aca4476c36403")))
       (sha256
        (base32 "0gbfq64rgl48rj5la2x49516ghr29fc58p49bwi2fp7xi22bak7z"))))
    (build-system font-build-system)
    (home-page "https://velvetyne.fr/fonts/sligoil")
    (synopsis
     "A Typeface influenced by the culture of the British isles")
    (description
"Sligoil is a monospace typeface. It has been designed for the interface of the Unknown Number game, published by Godolphin Games. Sligoil is also the name of an evil fictional company within the game.

The Sligoil typeface has been influenced by the culture of the British isles (the work of Matthew Carter, of course, but also signs on Irish whiskey distilleries) and also by the letters on vintage Space Cadet keyboards (produced by the MIT). It presents wide language support for Latin-based European languages and a collection of symbols and alternate forms (including upright italic letters).

Sligoil by Ariel Martín Pérez. Distributed by velvetyne.fr")
    (license license:silofl1.1)))


;; https://velvetyne.fr/fonts/outward/
;; font-velvetyne-outward

(define-public font-velvetyne-outward
  (package
    (name "font-velvetyne-outward")
    (version "1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/raoulaudouin/Outward/")
             (commit "e541c20e28d6aa9b8d51489c86d0bb71b2a1e431")))
       (sha256
        (base32 "0s3jjw05kypa9id8a9dy33nb73h38b8adi33ahz2ki16xfj45gf6"))))
    (build-system font-build-system)
    (home-page "https://velvetyne.fr/fonts/")
    (synopsis
     "Outward is a display font family with three cuts")
    (description
"Outward is a display font family coming in three cuts: Block (regular), Round (italic) and Borders (bold). Outward Block was initially designed in capitals only with the intent of getting rid of white spaces to reach a black type color, as opposed to the ideal grey sought after by typographers. The extended set of characters and families was developed following this root.

Outward by Raoul Audouin. Distributed by velvetyne.fr")
    (license license:silofl1.1)))


;; https://velvetyne.fr/fonts/karrik/
;; font-velvetyne-karrik

(define-public font-velvetyne-karrik
  (package
    (name "font-velvetyne-karrik")
    (version "1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/phantomfoundry/karrik_fonts")
             (commit "42ae96dcdfdd75b883d4d56a783c337f818f6651")))
       (sha256
        (base32 "0w3jprghkasyrn4gi9qpmdngrsqfr8hdfdr7l52j87mk26c859gd"))))
    (build-system font-build-system)
    (home-page "https://velvetyne.fr/fonts/karrik")
    (synopsis
     "Karrik is rooted in vernacular typography")
    (description
"Karrik is rooted in vernacular typography. The weight disadjustments, the lack of optical corrections, the uneven width of the letters are some of the features of early sans serif typefaces that inspired us in this boundless “reinterpretation.” We kept these features noticeable at display font sizes — but with the constraint that the typeface remains legible at body copy size. A set of random, chaotic uppercase letters—accessible with the stylistic set “SS01”–has been added as tribute to the roots of Karrik; uneven garage letterings, nameless fonts of obscure and discontinued foundries.

Karrik by Jean-Baptiste Morizot, Lucas Le Bihan. Distributed by velvetyne.fr")
    (license license:silofl1.1)))


;; https://velvetyne.fr/fonts/le-murmure/
;; font-velvetyne-le-murmure

(define-public font-velvetyne-murmure
  (package
    (name "font-velvetyne-le-murmure")
    (version "1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/velvetyne/murmure")
             (commit "7cfa8faf6ce6fe8d030410913b6147931cdc2ecb")))
       (sha256
        (base32 "0l8w6942ndmjm8zjkr2m2y2j6jbkq1iq7sdchma1xr1j1zmjzza0"))))
    (build-system font-build-system)
    (home-page "https://velvetyne.fr/fonts/le-murmure")
    (synopsis
     "Le Murmure font plays on a skillful mismatch between characters")
    (description
"Used as a titling font, its height and the stability of its shapes lend it elegance, whilst details inspired by calligraphy and technique reveal all of Murmure’s notions of experimentation, research and creativity. Le Murmure is a typeface devoid of serifs which combines effectiveness, legibility and singularity. Its highly condensed proportions draw their inspiration from magazine titling fonts and add the editorial dimension the agency wished to endow their new identity with.

This typeface comes with many glyph variations, meaning alternate letters drawn in an even more original way. Here lies infinite potential which the users will take great delight in exploiting through a random opentype function.

Inga Plönnig's Magnet was a great influence on Le Murmure. If you like Le Murmure, you should defintely have a look at the broader family that Magnet has to offer.

Le Murmure by Jérémy Landes. Distributed by velvetyne.fr")
    (license license:silofl1.1)))


;; https://velvetyne.fr/fonts/resistance/
;; font-velvetyne-resistance

(define-public font-velvetyne-resistance
  (package
    (name "font-velvetyne-resistance")
    (version "1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/velvetyne/resistance-generale")
             (commit "b45a061aa8e7f1fdd783fc3170438bf7238ca656")))
       (sha256
        (base32 "032cl77fx72y0d16rglbanm1mrfv20r7a18l6qwzm59l1k45wd86"))))
    (build-system font-build-system)
    (home-page "https://velvetyne.fr/fonts/resistance")
    (synopsis
     "resistance generale")
    (description
"Font created using Glyphr Studio by the students of ENSAD Paris at La Générale, with the help of the F/LOS foundry Velvetyne.

Creators : Pauline Cormault, Esther Michaud, Claire Mucchieli, Merlin Andreae, Raphaël Maman, Pedro Gomes-Cardoso, Juliette Nier, Gabrielle Meistretty, Damien Bauza.

Résistance by A collective. Distributed by velvetyne.fr")
    (license license:silofl1.1)))


;; https://velvetyne.fr/fonts/gulax/

(define-public font-velvetyne-gulax
  (package
    (name "font-velvetyne-gulax")
    (version "1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/velvetyne/gulax")
             (commit "25ad92e48c142ad0f50c70f4fbaed3a44d93e37a")))
       (sha256
        (base32 "1z4xgck5nqpdc35qc6wrgjgsymwah7yc7mpmi1mzav2p8pf9p75q"))))
    (build-system font-build-system)
    (home-page "https://velvetyne.fr/fonts/gulax")
    (synopsis
     "Another 'experimental' monolinear sans")
    (description
"Again another 'experimental' monolinear sans. Enjoy or not.

Gulax by Morgan Gilbert, with the contribution of Anton Moglia. Distributed by velvetyne.fr")
    (license license:silofl1.1)))


;; https://velvetyne.fr/fonts/lineal/

(define-public font-velvetyne-lineal
  (package
    (name "font-velvetyne-lineal")
    (version "1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/velvetyne/lineal")
             (commit "8dfea6601fdb5022ec38fc6d83de3cc44cb1bffa")))
       (sha256
        (base32 "0g3q823i80ibnqlvp817nz1z3w0vbk5gzqqy6b6h2j8qbh09y2kp"))))
    (build-system font-build-system)
    (home-page "https://velvetyne.fr/fonts/")
    (synopsis
     "Sort of Futura built with modules, without any optical corrections")
    (description
"Lineal is a Libre Family initiated by Frank Adebiaye and updated by the Velvetyne Team.

According to Frank, Lineal was originally inspired by the song called 2870 by Gérard Manset. It ended-up looking like a sort of Futura built with modules, without any optical corrections. Its first version was drawn in 2010 with FontForge 2.0. and published on Velvetyne on February 2011.

Since 2019, Anton Moglia worked on enhancing the character set, to fit his own needs (with Glyphs App). It was largely developed by Anton Moglia, who reviewed all the capitals, added lowercase letters and other symbols and gave it a more stable structure. He extended the family by adding weights, from Thin to Heavy and cleaned up the entire character set of superfluous curve points.

During 2023, Ariel Martín Pérez helped Anton Moglia publish this substantial update of Lineal, developing the character set for other languages and helping build the repository for publication. Ariel Martín Pérez expanded language support and improved spacing and kerning.

Lineal by Frank Adebiaye, with the contribution of Anton Moglia, Ariel Martín Pérez. Distributed by velvetyne.fr")
    (license license:silofl1.1)))


;; https://velvetyne.fr/fonts/amdal/

(define-public font-velvetyne-amdal
  (package
    (name "font-velvetyne-amdal")
    (version "1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/velvetyne/amdal")
             (commit "4896d186680c62d002702f4c17ac741038b3d905")))
       (sha256
        (base32 "02v6gqz1gl0q63vb5ipr389mql1cav94qcwwqrcjjv899pzx7nnp"))))
    (build-system font-build-system)
    (home-page "https://velvetyne.fr/fonts/amdal")
    (synopsis
     "Amdal is a Tifinagh titling font")
    (description
"Amdal is a Tifinagh typeface designed by Walid Bouchouchi - Akakir Studio. Tifinagh is the alphabet used to write Tamazight, a language common to several North African countries and an official language in Algeria and Morocco. This alphabet finds its origin in antiquity, it has long fallen into disrepair, and reintroduced thanks to the committed work of linguists and historians of the region.

Amdal is a titling font, born out of a lettering project for Korean fashion brand Merely Made, which was developing a collection inspired by the Sahara (North African desert) with the keyphrase  “a better world”. From there began the development of a font with a limited glyphset intended to write a particular sentence. Then the rest of the glyphs followed until the glyphsets for Basic-IRCAM, Extended, Neo-Tifinagh and Touareg were completed.

 “Amdal” means  “World” in Tamazight (Berber language).

Amdal by Walid Bouchouchi. Distributed by velvetyne.fr")
    (license license:silofl1.1)))


;; https://velvetyne.fr/fonts/lithops/

(define-public font-velvetyne-lithops
  (package
    (name "font-velvetyne-lithops")
    (version "1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/daytonamess/lithops")
             (commit "b9f42e0fb75746fa72a23cc96d86891c42d4eaba")))
       (sha256
        (base32 "0isjklwhpdlkff9h7xpczkrx7bc5qkb0f15g7gc9msfc7nm3d3c2"))))
    (build-system font-build-system)
    (home-page "https://velvetyne.fr/fonts/lithops")
    (synopsis
     "Lithops is a very display, very unique, very complex semi modular font")
    (description
"Lithops is a very display, very unique, very complex semi modular font. Uppercase only, it was originally hand drawn in Procreate, and then processed in Glyphs 3. Its name stems from succulent plants to which it bears a resemblance, and was (loosely) inspired by Art Nouveau, Alzheimer brains and Matisse cutouts. Lithops started in February 2021 as a spontaneous creative outlet and glyph drawing exercise. Though it may not be easy to use and is difficult to categorise, Lithops serves as an exploration of the future of type design, begging the question: how complex can a font be, all while staying cohesive, legible and aesthetically pleasing, and most importantly, fun?

Lithops by Anne-Dauphine Borione. Distributed by velvetyne.fr")
    (license license:silofl1.1)))

;; skel

;; (define-public font-velvetyne-
;;   (package
;;     (name "font-velvetyne-")
;;     (version "1")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://gitlab.com/velvetyne/")
;;              (commit "")))
;;        (sha256
;;         (base32 ""))))
;;     (build-system font-build-system)
;;     (home-page "https://velvetyne.fr/fonts/")
;;     (synopsis
;;      "")
;;     (description
;; "")
;;     (license license:silofl1.1)))
