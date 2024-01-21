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

;; https://usemodify.com/
;;   see also -> https://typespecimens.xyz/

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

;; https://usemodify.com/fonts/version/

;; https://usemodify.com/fonts/hibana/

;; https://usemodify.com/fonts/heal-the-web/

;; https://usemodify.com/fonts/dinish/

;; https://usemodify.com/fonts/authentic-sans/


;; https://usemodify.com/fonts/lucette/

;; https://usemodify.com/fonts/aboensis/

;; https://usemodify.com/fonts/barlow/

;; https://usemodify.com/fonts/ferrite-core/

;; https://usemodify.com/fonts/routed-gothic-font/

;; https://usemodify.com/fonts/orchard-linear/

;; https://usemodify.com/fonts/profont/

;; https://usemodify.com/fonts/apl386/

;; https://usemodify.com/fonts/lunchtype/

;; https://usemodify.com/fonts/redaction/

;; https://usemodify.com/fonts/league-mono/

;; https://usemodify.com/fonts/manusquared/

;; https://usemodify.com/fonts/victor-mono/

;; https://usemodify.com/fonts/ia-writer/





;; url fetch

;; (define-public font-osp-belgica-belgika
;;   (package
;;     (name "font-osp-belgica-belgika")
;;     (version "1")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri "https://gitlab.constantvzw.org/osp/foundry.belgica-belgika/-/archive/master/foundry.belgica-belgika-master.zip")
;;        (sha256
;;         (base32 "0c5ilf59f70fwyl5rcvqs8q1cicv5v7rhrvsj24vqsfd3ig9x1c1"))))
;;     (build-system font-build-system)
;;     (home-page "http://osp.kitchen/foundry/belgica-belgika")
;;     (synopsis
;;      "Stroke fonts with no contrast and capital letters only based on diverse pseudo-generic elements for multi-usages")
;;     (description
;;      "Stroke fonts with no contrast and capital letters only based on diverse pseudo-generic elements for multi-usages.")
;;     (license license:silofl1.1)))


;; git fetch

;; (define-public font-osp-libertinage
;;   (package
;;     (name "font-osp-libertinage")
;;     (version "1")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://gitlab.constantvzw.org/osp/foundry.libertinage")
;;              (commit "")))
;;        (sha256
;;         (base32 "10bv9kksmbsi1zf0gylywgxch6sp8c2pkyn1y6c3vs1ivhfjn9m5"))))
;;     (build-system font-build-system)
;;     (home-page "http://osp.kitchen/foundry/libertinage/")
;;     (synopsis
;;      "A font made by copying and pasting parts of Linux Libertine glyphs.")
;;     (description
;;      "The Libertinage font-set we developed for the FLOSS+Art book. It was built by copying and pasting parts of Linux Libertine glyphs or simply by all-turning glyphs. There are 27 variations, one for each letter of the Latin alphabet and the ‘Full’ version, containing all modifications.")
;;     (license license:silofl1.1)))
