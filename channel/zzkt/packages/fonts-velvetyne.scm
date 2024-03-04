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
;;  updated 2024-03-03 13:03:09

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
                       font-velvetyne-anthony
                       font-velvetyne-avara
                       font-velvetyne-backout
                       font-velvetyne-basteleur
                       font-velvetyne-bianzhidai
                       font-velvetyne-cirruscumulus
                       font-velvetyne-compagnon
                       font-velvetyne-degheest
                       font-velvetyne-facade
                       font-velvetyne-format-1452
                       font-velvetyne-fungal
                       font-velvetyne-grotesk
                       font-velvetyne-gulax
                       font-velvetyne-jgs
                       font-velvetyne-kaeru-kaeru
                       font-velvetyne-karrik
                       font-velvetyne-lineal
                       font-velvetyne-lithops
                       font-velvetyne-mess
                       font-velvetyne-mourier
                       font-velvetyne-murmure
                       font-velvetyne-ouroboros
                       font-velvetyne-outward
                       font-velvetyne-picnic
                       font-velvetyne-pilowlava
                       font-velvetyne-resistance
                       font-velvetyne-sligoil
                       font-velvetyne-tiny
                       font-velvetyne-trickster
                       font-velvetyne-typefesse
                       font-velvetyne-vg5000
                       ))
   (synopsis "A collection of fonts from Velvetyne")
   (home-page "https://velvetyne.fr/")
   (description
    "A collection of fonts from Velvetyne including; Anthony, Avara, BackOut, Basteleur, CirrusCumulus, Compagnon, Façade, Grotesk, Jgs font, Kaeru Kaeru, Mourier, Ouroboros, PicNic, Pilowlava, TINY, Typefesse, VG5000, Mess, Format 1452, Trickster, Lithops, Lineal, Amdal, Gulax, BianZhiDai, Degheest, Fungal, Karrik, Le Murmure, Outward, Resistance, Sligoil.")
   (license license:silofl1.1)))


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


(define-public font-velvetyne-resistance
  (package
   (name "font-velvetyne-resistance")
   (version "1")
   (source
    (origin
     (method url-fetch)
     (uri "https://github.com/velvetyne/resistance-generale/archive/master.zip")
     (sha256
      (base32 "0zyd63zhxg2b59ahmxkw9aabqxyn9bjvnbarp053k1jna9rl9csg"))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/resistance")
   (synopsis
    "Résistance generale")
   (description
    "Font created using Glyphr Studio by the students of ENSAD Paris at La Générale, with the help of the F/LOS foundry Velvetyne.

Creators: Pauline Cormault, Esther Michaud, Claire Mucchieli, Merlin Andreae, Raphaël Maman, Pedro Gomes-Cardoso, Juliette Nier, Gabrielle Meistretty, Damien Bauza.

Résistance by A collective. Distributed by velvetyne.fr")
   (license license:silofl1.1)))


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


(define-public font-velvetyne-anthony
  (package
   (name "font-velvetyne-anthony")
   (version "1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gitlab.com/velvetyne/anthony")
           (commit "bf84739794cf48ff661f3ba6cee2dc38f3bc4710")))
     (sha256
      (base32 "0q5c5y3g9r6f6jla7z4xmcl1vprr4l1ai5dgdyikmj1dsbdig7fy"))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/anthony/")
   (synopsis
    "A typeface inspired by artworks of British sculptor Anthony Caro")
   (description
    "Anthony is a typeface designed by Sun Young Oh and inspired by the artworks of British sculptor Anthony Caro. The form of this typeface comes from his sculptures that are leaning against each other.

The typeface is packed with alternates for most letters that are pseudo-randomly picked when you write some text.

Anthony by Sun Young Oh. Distributed by velvetyne.fr.")
   (license license:silofl1.1)))


(define-public font-velvetyne-avara
  (package
   (name "font-velvetyne-avara")
   (version "1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gitlab.com/velvetyne/avara")
           (commit "cb655944d819ff3636e35bc58407e2b30b36e6fe")))
     (sha256
      (base32 "0prh207as83md0hqych3hvzlvwck2k5hcy6mw531bjgacmlv731r"))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/avara/")
   (synopsis
    "Libre transitional serif curveless font based on a square grid")
   (description
    "Avara is a libre transitional serif curveless type family. The placement of its nodes is exclusively based on a rough square grid. The original reason of this design choice was to facilitate collaboration on the font, and it now results in the radical and highly constrained shapes of this type family. It was started and first released in November 2011 by Raphaël Bastide; it has been updated since then and finally published here. It might be updated again in the future, tho. Maybe by you.

The Bold style was initiated by Raphaël Bastide and continued by Wei Huang and Lucas Le Bihan; the Bold Italic by Lucas Le Bihan; the Black was started by Walid Bouchouchi and Jérémy Landes, then it was boldened again and finished by Lucas Le Bihan.

Avara by Raphaël Bastide, with the contribution of Wei Huang, Lucas Le Bihan, Walid Bouchouchi, Jérémy Landes. Distributed by velvetyne.fr.")
   (license license:silofl1.1)))


(define-public font-velvetyne-backout
  (package
   (name "font-velvetyne-backout")
   (version "1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gitlab.com/velvetyne/backout")
           (commit "4f894ca0bf7d46e12a1e818d24a1234660e5848b")))
     (sha256
      (base32 "092kp582876nvk4dgfjfd55fipjj17wjv82s1cf4924v5k2j2nah"))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/backout/")
   (synopsis
    "BackOut is a kind of African Glyphic typeface")
   (description
    "Inspired by humanist typefaces such as Albertus, BackOut has a decidely African design. Its name comes from the eponymous song by Bob Marley and The Wailers.

The 2.0 version of BackOut is a faithful review of Frank's original with improved spacing and kerning, corrected contrast, new lowercase letters and extended language support and functionalities. In October 2022, the 2.1 version was released, with revised kerning and some minor modifications.

BackOut by Frank Adebiaye, with the contribution of Ariel Martín Pérez. Distributed by velvetyne.fr.")
   (license license:silofl1.1)))


(define-public font-velvetyne-basteleur
  (package
   (name "font-velvetyne-basteleur")
   (version "1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gitlab.com/velvetyne/basteleur")
           (commit "f32302d63d46e9b996f329648b0f2df01c9190f5")))
     (sha256
      (base32 "0yfnx58fi8q6ccppq5rjz3j21sd0v8zxcyhiw4q7k6p9wzvnagh7"))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/basteleur/")
   (synopsis
    "A funny blend of medieval-ish and cooperblack-ish")
   (description
    "This typeface was designed with the Tarot de Marseille in mind. This led to a funny blend of medieval-ish and cooperblack-ish typeface. An anniversary update of June 2022 adds a lighter and sharper weight to the original bold and soft one.

The Basteleur Arcana represents a lot of things a designer can experience: new beginnings, having fun, crafting, but also a lack of confidence and having hard time to finish projects

Basteleur by Keussel. Distributed by velvetyne.fr.")
   (license license:silofl1.1)))


(define-public font-velvetyne-cirruscumulus
  (package
   (name "font-velvetyne-cirruscumulus")
   (version "1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gitlab.com/Clarasambot/cirruscumulus")
           (commit "f4a5673e51959e55fc488df00a9f3d638a850677")))
     (sha256
      (base32 "0bn74b8rr2cl5y5nkcdq736c6qbvy1a6l5j6k3clx5qfgbhdchd1"))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/cirruscumulus/")
   (synopsis
    "Modular typeface inspired by scientific diagrams")
   (description
    "CirrusCumulus was designed without using curves. it's made-up of different modules inspired by scientific diagrams. CirrusCumulus is also a hybridization of two styles: it has a lineal-style lowercase set, as well as a script-like uppercase set, while some glyphs adopt italic forms which produce unusual combinations, arabesques and ligatures. CirrusCumulus includes a large panel of characters that can be used to draw figures, shapes or patterns, a variable ligature system, and many non-binary and inclusive glyphs.

CirrusCumulus by Clara Sambot. Distributed by velvetyne.fr.")
   (license license:silofl1.1)))


(define-public font-velvetyne-compagnon
  (package
   (name "font-velvetyne-compagnon")
   (version "1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gitlab.com/velvetyne/compagnon")
           (commit "4f2344df5adb6eaf9ffd9215c5406c0729fb7aa1")))
     (sha256
      (base32 "1rm1v9yd2wv9m8aafs9gz9m93nfsrj5d0iix4iqbrdk38rsgwm07"))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/compagnon/")
   (synopsis
    "Font family inspired by the Typewriter Database archives")
   (description
    "Compagnon is a typeface family composed of five distinctive styles. It finds its inspiration in the online archives of Typewriter Database specimens and combines different periods of the history of typewriter typefaces. Each weight is based on singular references relating to significant periods aiming to underline the evolution of typewriter characters as they are called.

Compagnon by Juliette Duhé, Léa Pradine, Valentin Papon, Chloé Lozano, Sébastien Riollier. Distributed by velvetyne.fr.")
   (license license:silofl1.1)))


(define-public font-velvetyne-facade
  (package
   (name "font-velvetyne-facade")
   (version "1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/eleonorefines/Facade-font")
           (commit "67a50fcb5986cd1a14d5183f5dfdda717db105e2")))
     (sha256
      (base32 "1gpilpsv20rq1s2458wa4ydqdqrbw5wxj3l61jqqi24a7lv4k7m7"))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/facade/")
   (synopsis
    "")
   (description
    "Façade is a typeface created from the architectural grid of the ÉSAD Orléans facade. This grid is used as a basis for the first sketches, then as a spirit for all the typefaces. The "sud" (south) version is faithful to the architecture while the other weights are emancipated from it.

Façade by Éléonore Fines. Distributed by velvetyne.fr.")
   (license license:silofl1.1)))


(define-public font-velvetyne-grotesk
  (package
   (name "font-velvetyne-grotesk")
   (version "1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gitlab.com/velvetyne/grotesk")
           (commit "ac79fbc0f818fba94b61fb7f302e44ebc7a107bf")))
     (sha256
      (base32 "04hvy34li3zd6byrx24f3p06jnfd4n1cf4pdlh60044crbd30nzh"))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/grotesk/")
   (synopsis
    "Grotesk is a heavily geometric sans serif typeface with an unusually large spacing")
   (description
    "Grotesk is one of Velvetyne's first published typefaces. Designed by Frank Adebiaye in 2010 and released on Velvetyne in 2012, Grotesk is a heavily geometric sans serif typeface with an unusually large spacing. The original version of Grotesk is known because it was used on the official website of the city of Paris for many years. Even if the city's visual identity has changed since then, the broken "S" of Grotesk can still be seen in some of the technical vehicles of the city.

In 2023, a new version of Grotesk developed by Ariel Martín Pérez was released. This new version introduces new weights that are multiplexed, which means that you can change the weight of the font without changing the width of the paragraphs. This new version also presents some subtle optical corrections. Last but not least, it considerably expands the glyphset of the font with a brand new lowercase set as well as language support for Russian, Ukrainian, Tifinagh and many Latin-based languages.

You can use Grotesk to give a relaxed and elegant touch to your texts, its subtle art-déco flavour will enlighten any composition.

Grotesk by Frank Adebiaye, with the contribution of Ariel Martín Pérez. Distributed by velvetyne.fr.")
   (license license:silofl1.1)))


(define-public font-velvetyne-jgs
  (package
   (name "font-velvetyne-jgs")
   (version "1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gitlab.com/velvetyne/jgs")
           (commit "b1fe344c6ab4cb97aa9ceb09ba3b6056f826b040")))
     (sha256
      (base32 "1hwaylgih66cqwcf68i2xdccrn0p0rbvmlz5f3mlzvm51s5pzqb8"))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/jgs-font/")
   (synopsis
    "Jgs Font is a font family specifically designed to draw ASCII art")
   (description
    "Jgs Font is a font family made as a tribute to Joan G. Stark (a.k.a. jgs, Spunk), pioneer of ASCII art.

This font has been specifically designed to draw ASCII art. Its bitmap look and its shapes accentuate the ambiguity between text and drawing. The "graphic" properties of the characters have been exaggerated depending on the way ASCII artists use them.

The glyphs that make up Jgs Font can be combined from one character to the next in line or from one line to another. It allows, by association of characters, to produce continuous lines, curves, frames, patterns, levels of gray.

In order to be able to change body size while maintaining these pixel-perfect continuity effects, the family is available in three fonts.

Jgs5 for body text sizes that are a multiple of 10 : 10px, 20px, 30px etc. Jgs7 for body text sizes that are a multiple of 14 : 14px, 28px, 42px etc. Jgs9 for body text sizes that are a multiple of 18 : 18px, 36px, 54px etc.

For better results, the body size and the leading need to have exactly the same value and correspond to the multiples cited above.

Jgs font by Adel Faure. Distributed by velvetyne.fr.")
   (license license:silofl1.1)))


(define-public font-velvetyne-kaeru-kaeru
  (package
   (name "font-velvetyne-kaeru-kaeru")
   (version "1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gitlab.com/velvetyne/kaeru-kaeru")
           (commit "")))
     (sha256
      (base32 ""))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/kaeru-kaeru/")
   (synopsis
    "Bright colored and blobby shaped patterns of the poison dart frog mixed together with the strangely formed muscles in Japanese woodcuts")
   (description
    "Bright colored and blobby shaped patterns of the poison dart frog mixed together with the strangely formed muscles in Japanese woodcuts. Kaeru kaeru combines both inspirations in one typeface.

It was created in a seminar called 'Type – Inspiration elsewhere' led by Jérémy Landes at the HfG Karlsruhe. The idea of the seminar was, to take different inspirations out of nature and illustrations and try to combine them to one typeface.

Kaeru Kaeru by Isabel Motz. Distributed by velvetyne.fr.")
   (license license:silofl1.1)))


(define-public font-velvetyne-mourier
  (package
   (name "font-velvetyne-mourier")
   (version "1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gitlab.com/velvetyne/mourier")
           (commit "02c6e2d3aa23b3b8b625f50b7a912baa02e055f5")))
     (sha256
      (base32 "19na95101ky85knkz7qv7v6225ghy714nhsq8j2vb3mgv6qdkrd4"))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/mourier/")
   (synopsis
    "")
   (description
    "Mourier is a geometric alphabet designed by Eric Mourier in 1971 following a strict set of rules. The font is based on a square of 7 x 7 units and made of unclosed lines. The first and only use of the lead-cast font was on the booklet 'The Myth about Bird B', a leporello design by Mourier and written by Knud Holten (a poet).

In 2002, Sébastien Hayez adapted the typeface as a digital font, with the approval of its original designer (thanks to him), which was afterwards published as part of the Velvetyne Type Foundry collection in 2011. Then, in 2020, Ukraininan designer Alex Ash (Alexander Kondratenko) proposed a Cyrillic alphabet expansion of the font, of which he had imagined the capitals. Ariel Martín Perez took this opportunity and developped lowercase letters for Latin and Cyrillic scripts (with feedback from Alex Ash for the Cyrillic), added diacritics and symbols, mastered the font and also created several sets of alternates.

Mourier by Eric Mourier, with the contribution of Sébastien Hayez, Ariel Martín Pérez, Alexander Kondratenko. Distributed by velvetyne.fr.")
   (license license:silofl1.1)))


(define-public font-velvetyne-ouroboros
  (package
   (name "font-velvetyne-ouroboros")
   (version "1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gitlab.com/arielmartinperez/ouroboros/")
           (commit "7250b7c0a1af0648f4c88d7e05b7f189a934489c")))
     (sha256
      (base32 "0lh3f57qzc6bmbym3f2ffsc0pb6m7fcsbvqa8qyb95mqpxljnx1v"))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/ouroboros/")
   (synopsis
    "Ouroboros is a font for alchemists, witches, heretics, outsiders and curious people in general")
   (description
    "The Ouroboros or uroborus is an ancient symbol depicting a serpent or dragon eating its own tail. Ouroboros is also a font for alchemists, witches, heretics, outsiders and curious people in general. It's inspired by early art-nouveau styles, which were sometimes used in relation with magical themes and symbolism, so it comes together with a set of alchemical and astronomical symbols.

Ouroboros by Ariel Martín Pérez, with the contribution of H·Alix Sanyas. Distributed by velvetyne.fr.")
   (license license:silofl1.1)))


(define-public font-velvetyne-picnic
  (package
   (name "font-velvetyne-picnic")
   (version "1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gitlab.com/mariellenils/PicNic")
           (commit "acadbd37f9d85a913ca1e0bd3724ecd6a96ddd90")))
     (sha256
      (base32 "0jhs7m8rl2n5a690hfvl4y8xzjdby1ilz12yva7374q1av5dkf5z"))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/picnic/")
   (synopsis
    "An organic typeface inhabiting a cloud of contextual ligatures and inclusive ligatures")
   (description
    "PicNic is an organic typeface inhabiting a cloud of contextual ligatures and inclusive ligatures, substituting for the midpoint automatically. They are designed mainly for French.

The shapes are inspired by the trajectory of a drop of water on an oilcloth, the shadows of the tree leaves on the fabric lying in the grass, the precise path that the ant takes to the watermelon. They attempt to translate the sensory experience of a picnic among friends.

This typeface will suit for all wild, poetic and bucolic explorers for their most adventurous excursions.

PicNic by Mariel Nils. Distributed by velvetyne.fr.")
   (license license:silofl1.1)))


(define-public font-velvetyne-pilowlava
  (package
   (name "font-velvetyne-pilowlava")
   (version "1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gitlab.com/StudioTriple/pilowlava/")
           (commit "f9ad3674c77465ada43c909197f7696e818182c0")))
     (sha256
      (base32 "07n5lkprm1xr74v8z223xdb7qs510cvgkvikzmha2vsvkm86k6j6"))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/pilowlava/")
   (synopsis
    "A typeface that recalls cooled lava flows drawn with a compass")
   (description
    "Pilowlava (sic) was born as an intuitive, fast-paced creative feedback loop in which its creators tried to surprise one another. The result is a typeface that recalls cooled lava flows drawn with a compass. Striving to please both of its parents, Pilowlava seeks a balance between viscous energy and controlled geometry. This geometric approach lies on the shoulders of researches conducted by Swiss designer Armin Hofmann in his Graphic Design Manual edited in 1965. The structures of its glyphs are mostly derived from hand-written dynamics, that feed from both calligraphic and graffiti references. All these sweet inconsistencies produce a vacillating, fluctuating typographic colour, embodied by the almost-mathematical tension of its curves. Under a hardened crust, Pilowlava awaits the smallest temperature rise to recover its viscosity. The alternate shapes of certain letters play out these thermic accidents and raise the temperature of the text.

It takes its name from lava pillows, a natural phenomenon that is produced when lava is expelled by an underwater volcano, or when the lava flows of an emerged volcano encounter a body of water. In contact with the water, the lava flow is so hot that it's coated in a glass film. As it isn't totally cooled down, it transforms into smooth pillows that continue to slowly grow. This way, lava creates tubes and viscous balls that pile up and shape one another, and then they aggregate in puffy clusters that can measure several meters.

Pilowlava by Anton Moglia, Jérémy Landes, with the contribution of Maksym Kobuzan. Distributed by velvetyne.fr.")
   (license license:silofl1.1)))


(define-public font-velvetyne-tiny
  (package
   (name "font-velvetyne-tiny")
   (version "1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jckfa/tinyfonts")
           (commit "259f633d770ea08cbb9620d477fdfa7a7384efc2")))
     (sha256
      (base32 "01d0iqch1z60nlvcmgchallkcsk06dblzw7zfv5hnp60m0pkqkki"))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/tiny/")
   (synopsis
    "A font family based around the smallest type size of the HandJet EBS-250")
   (description
    "The TINY font family was originally created over the summer of 2018 as the visual identity for an experimental retail pop-up shop in Chinatown, New York City called “Today in New York”, or TINY for short. The shop was the result of an intern project at Verdes, a creative agency, between Jack Halten Fahnestock and Théïa Flynn, where they sold T-shirts and tote bags customized on the spot. TINY is based on the smallest type size (using only 5 of the 16 available print heads) of the HandJet EBS-250, the tool used in the shop for immediate printing on textiles. Its variable dot size comes from the HandJet’s adjustable ink output.

TINY 5x3 comes as a variable font with a size axis to modify dot size from 0—300, as well as 15 separate instances (each increasing the dot size by 20 units).

TINY by Jack Halten Fahnestock. Distributed by velvetyne.fr.")
   (license license:silofl1.1)))


(define-public font-velvetyne-typefesse
  (package
   (name "font-velvetyne-typefesse")
   (version "1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/ohpla/typefesse")
           (commit "3a1d99ace34398547315e55dafb7263310148350")))
     (sha256
      (base32 "1ixgmcrnmyqggjgwh8ir39cjwzcqc1sikmkwwdpacxxr4kmgzchg"))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/typefesse/")
   (synopsis
    "")
   (description
    "Typefesse is a playful butt-shaped typeface in which the letters are rendered in such a way that the reading is done through the folds of the body.

The design of Typefesse is motivated by the surprising combination of two vocabularies, that of the body and that of the alphabet. The drawn alphabet reveals contortionist and playful creatures that either hide inside of it or that expose themselves to it. Is it the letter that defines the bodies' shapes, or is it the other way around? These creatures play with the viewer's gaze and fight against the lettershapes by disturbing their readability with their exuberance. The alphabet is laid bare and readers become spectator-voyeurs in spite of themselves. Typefesse is a typeface that generates a confusion between reading, seeing and spying. It's a titling font, although it has a surprising readability at small body sizes. Its three styles have been named in reference to the moon and its mysteries

Typefesse by Océane Juvin. Distributed by velvetyne.fr.")
   (license license:silofl1.1)))


(define-public font-velvetyne-vg5000
  (package
   (name "font-velvetyne-vg5000")
   (version "1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gitlab.com/velvetyne/vg5000")
           (commit "e4eeaed973f75fd5bafe2c69de60e8ad0f710f58")))
     (sha256
      (base32 "18dbay1yfy59zmis1iwpd55mjx713pjn71rid0wpa90kjdd0x8x6"))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/VG5000")
   (synopsis
    "A typeface inspired by the VG5000 computer manufactured by Phillips released in 1984")
   (description
    "The VG5000 takes its name from the homonymous computer manufactured by Phillips, released in 1984. Its video processor displays bitmap characters built in a common matrix of 8x10 dots. The modern VG5000 is built on a grid 4 times more detailed, allowing more freedom and imagination of curves, where there were only right angles. The superposition of the new drawing onto the starting matrix sometimes reveals unexpected mixtures. Some right angles have been deliberately preserved as vestiges of the first digital fonts, offering a hybrid final shape. One of the inherited features is the accents that are always placed at the same height, forcing some letters to crash. Many glyphs and pictograms complete the VG5000's original set, including references to VG5000 games and the history of emoji.

VG5000 by Justin Bihan. Distributed by velvetyne.fr.")
   (license license:silofl1.1)))


(define-public font-velvetyne-mess
  (package
   (name "font-velvetyne-mess")
   (version "1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gitlab.com/velvetyne/mess")
           (commit "c0ec947a54d664c2b08bd5e9a7b7baf877a73423")))
     (sha256
      (base32 "0k2gplsq837gxja2lbnqvv8pwx3yflnfp8gnm1ynmh4sa1nmp54i"))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/mess/")
   (synopsis
    "Possibly, glyphs are holding a clandestine meeting deep inside the font file")
   (description
    "Font is something like a corporation. From outside, it is hard for us to see how it works and who is working in it. In metal type era, we were close to glyphs but today we never know how they feels about their treatment. Possibly, glyphs are holding a clandestine meeting at the deep inside of font file and plan a sabotage against users and type engineers. We don't know, but…

Mess by Tezzo Suzuki. Distributed by velvetyne.fr.")
   (license license:silofl1.1)))


(define-public font-velvetyne-format-1452
  (package
   (name "font-velvetyne-format-1452")
   (version "1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gitlab.com/velvetyne/format-1452")
           (commit "4af715b8a873139975d2651f0e316604508635ff")))
     (sha256
      (base32 "0298xv8ndqi508adp21mcxwf15mqayqikrzb13zy2r9w7fwfnj0q"))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/format-1452/")
   (synopsis
    "A Din-like typeface built with modules, without any optical corrections.")
   (description
    "Format 1452 is a Din-like typeface built with modules, without any optical corrections.

Format 1452 by Frank Adebiaye, with the contribution of Anton Moglia. Distributed by velvetyne.fr.")
   (license license:silofl1.1)))


(define-public font-velvetyne-trickster
  (package
   (name "font-velvetyne-trickster")
   (version "1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gitlab.com/velvetyne/Trickster")
           (commit "751b1fa5fd5293614d0eb4df4962ec195fa243ab")))
     (sha256
      (base32 "1bjk7pz8lvkcx19wy0p8p1pj4xv0mvcspyf6vqg7a0q54l1vky0s"))))
   (build-system font-build-system)
   (home-page "https://velvetyne.fr/fonts/trickster/")
   (synopsis
    "Trickster is a typeface mixing a lot of oddities smoothly")
   (description
    "Sans-serif, but with calligraphic influence and strong contrast, Trickster borrows shapes from Merovingian writing, Blackletters construction and contemporean drawing. Trickster is a display typeface in one bold weight. Its unusual shapes, tight spacing and various alternates allow designers to create quickly strong headlines and beautiful titling.

According to Wikipedia, in mythology, and in the study of folklore and religion, a trickster is a character in a story (god, goddess, spirit, man, woman, or anthropomorphic creature), which exhibits a great degree of intellect or secret knowledge, and which uses it to play tricks or otherwise disobey normal rules and conventional behaviour. So that's the origin of the name of this typeface.

Trickster by Jean-Baptiste Morizot. Distributed by velvetyne.fr.")
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
