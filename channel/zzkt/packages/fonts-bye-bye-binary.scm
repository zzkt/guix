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

(define-module (zzkt packages fonts-bye-bye-binary)
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

;; https://typotheque.genderfluid.space/
;; https://gitlab.com/bye-bye-binary

;; https://typotheque.genderfluid.space/zip-fontes/josafronde.zip
;; https://typotheque.genderfluid.space/zip-fontes/cirruscumulus.zip
;; https://typotheque.genderfluid.space/zip-fontes/baskervvol.zip
;; https://typotheque.genderfluid.space/zip-fontes/dindong.zip
;; https://typotheque.genderfluid.space/zip-fontes/homoneta.zip
;; https://typotheque.genderfluid.space/zip-fontes/combine.zip
;; https://typotheque.genderfluid.space/zip-fontes/adelphe.zip
;; https://typotheque.genderfluid.space/zip-fontes/picnic.zip
;; https://typotheque.genderfluid.space/zip-fontes/ductus.zip
;; https://typotheque.genderfluid.space/zip-fontes/ductus-mono.zip
;; https://typotheque.genderfluid.space/zip-fontes/amiamie.zip
;; https://typotheque.genderfluid.space/zip-fontes/amiamie.zip
;; https://typotheque.genderfluid.space/zip-fontes/roberte.zip
;; https://typotheque.genderfluid.space/zip-fontes/escabeau.zip
;; https://typotheque.genderfluid.space/zip-fontes/crozet_te.zip
;; https://typotheque.genderfluid.space/zip-fontes/bbb-poppins-tn.zip

;; a metapackage for all packaged fonts
(define-public font-collection-bye-bye-binary
  (package
    (name "font-collection-bye-bye-binary")
    (version "0.1")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     '(#:builder (begin
                   (mkdir %output) #t)))
    (propagated-inputs (list font-baskervvol
                             font-dindong
                             font-homoneta
                             ;; font-adelphe
                             ;; font-ls-vg5000
                             ;; font-picnic
                             ;; font-ductus
                             ;; font-ductus-mono
                             ;; font-amiamie
                             ;; font-amiamie-round
                             ;; font-roberte
                             ;; font-escabeau
                             ;; font-crozet
                             ;; font-bbb-poppins-tn
                             ))
    (synopsis "A collection of fonts from Bye Bye Binary")
    (home-page "https://typotheque.genderfluid.space")
    (description
     "A collection of fonts")
    (license license:silofl1.1)))


;; Baskervvol - Bye Bye Binary - V1.0 — 2022

(define-public font-baskervvol
  (package
    (name "font-")
    (version "V1.0 — 2022")
    (source
     (origin
       (method url-fetch)
       (uri "https://typotheque.genderfluid.space/zip-fontes/baskervvol.zip")
       (sha256
        (base32 "0acx8knm8i6d0nqajsyxj3a2812ibdrmwr1mrbwwvzl1finj0skk"))))
    (build-system font-build-system)
    (home-page "https://typotheque.genderfluid.space/baskervvol.html")
    (synopsis
     "")
    (description
     "")
    (license license:silofl1.1)))

;; DINdong - Clara Sambot - V1.0 — 2022
;; https://typotheque.genderfluid.space/zip-fontes/dindong.zip

(define-public font-dindong
  (package
    (name "font-")
    (version "1")
    (source
     (origin
       (method url-fetch)
       (uri "https://typotheque.genderfluid.space/zip-fontes/dindong.zip")
       (sha256
        (base32 "14zz6pz9jwb28nb2n6jzi21r0jh2cv466p9d77cik2lb96ddn8wg"))))
    (build-system font-build-system)
    (home-page "https://typotheque.genderfluid.space/dindong.html")
    (synopsis
     "")
    (description
     "")
    (license license:silofl1.1)))

;; Homoneta - Quentin Lamouroux - V1.0 — 2022
;; https://typotheque.genderfluid.space/zip-fontes/homoneta.zip

(define-public font-homoneta
  (package
    (name "font-")
    (version "1")
    (source
     (origin
       (method url-fetch)
       (uri "https://typotheque.genderfluid.space/zip-fontes/homoneta.zip")
       (sha256
        (base32 "1dpwxkmc567nnl39k2m1chaz1105qdgfp42rac7mcjkvck5ff38h"))))
    (build-system font-build-system)
    (home-page "https://typotheque.genderfluid.space/homoneta.html")
    (synopsis
     "")
    (description
     "")
    (license license:silofl1.1)))


;; LS-VG5000 - Justin Bihan - V1.0 — 2022
;; http://www.lettres-simples.com/

;; Adelphe - Eugénie Bidaut - V2.0 — 2022
;; https://typotheque.genderfluid.space/zip-fontes/adelphe.zip

;; PicNic - Marielle Nils - V1.0 — 2022
;; https://typotheque.genderfluid.space/zip-fontes/picnic.zip

;; Ductus - Amélie Dumont - V1.0 — 2022
;; https://typotheque.genderfluid.space/zip-fontes/ductus.zip

;; Ductus Mono - Amélie Dumont - V1.0 — 2022
;; https://typotheque.genderfluid.space/zip-fontes/ductus-mono.zip

;; Amiamie- Mirat Masson - V1.0 — 2022
;; https://typotheque.genderfluid.space/zip-fontes/amiamie.zip

;; Amiamie Round - Mirat Masson - V1.0 — 2022
;; https://typotheque.genderfluid.space/zip-fontes/amiamie.zip

;; Roberte - Eugénie Bidaut - V1.0 — 2023
;; https://typotheque.genderfluid.space/zip-fontes/roberte.zip

;; Escabeau - Max Lillo - V1.0 — 2023
;; https://typotheque.genderfluid.space/zip-fontes/escabeau.zip

;; Crozet·te - Thaïs Cuny - V1.0 — 2023
;; https://typotheque.genderfluid.space/zip-fontes/crozet_te.zip

;; BBB Poppins TN - Eugénie Bidaut & Camille°Circlude | V1.0 — 2023
;; https://typotheque.genderfluid.space/zip-fontes/bbb-poppins-tn.zip


;; (define-public font-
;;  (package
;;     (name "font-")
;;     (version "1")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri "https://typotheque.genderfluid.space/zip-fontes/")
;;        (sha256
;;         (base32 ""))))
;;     (build-system font-build-system)
;;     (home-page "https://typotheque.genderfluid.space/")
;;     (synopsis
;;      "")
;;     (description
;;      "")
;;     (license license:silofl1.1)))
