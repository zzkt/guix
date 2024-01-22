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

(define-public font-sono
  (package
    (name "font-sono")
    (version "1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sursly/sono")
             (commit "7dc859025b464e8530d90116782b5407b7b6376d")))
       (sha256
        (base32 "07arajpymrpnayxidzbqx83ffp0fj5l25jddnjbi2r4hzjs4hfhk"))))
    (build-system font-build-system)
    (home-page "http://osp.kitchen/foundry/libertinage/")
    (synopsis
     "A soft monospace (or proportional!) variable font")
    (description
     "A soft monospace (or proportional!) variable font by Tyler Finck.

Sono was initially only monospace. Sono was released in 2020 and was named for its most obvious characterstics: soft, monospaced. It has a low cap height which I enjoy when typing with THE CAPS LOCK KEY TURNED ON. Sono has been constantly updated and in 2022 received an additional axis called mono which has corresponding proportional styles. Those styles are prefixed with the name “Sans” for the sake of brevity. The name Sono doesn’t make as much sense now, but changing it would upset a precarious balance in the universe. Ok maybe not that severe. But it’d be weird. This is also the final free font I intend to make in the foreseeable future.

Sono comes in static styles for desktop and web as well as a single variable font and has received several updates since its release in August of 2018. It is available on Github and on Google Fonts.")
    (license license:silofl1.1)))

;; https://usemodify.com/fonts/violet-sans/

(define-public font-violet-sans
  (package
    (name "font-violet-sans")
    (version "1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/violetoffice/violet_sans/")
             (commit "e332826cf8445d60bf17bd21c07eafb052cf9070")))
       (sha256
        (base32 "1fwsr5b03qrfh5axmdwj7452z1x9w48xa13swyp3khbl1z0pij8f"))))
    (build-system font-build-system)
    (home-page "https://usemodify.com/fonts/violet-sans/")
    (synopsis
     "Violet Sans finds harmony in disparate forms"
    (description
     "Violet Sans finds harmony in disparate forms, at once sharp and aggressive it can retreat to being gentle and smooth, allowing for different expressions within a single weight and style. Initially designed as an all caps display face with generous counterforms and extended crossbars, this same personality has been extrapolated into the wider character set. As a nod to the long tradition of geometric sans serif typefaces, in particular Eurostile, Violet Sans has been developed for modern applications with a bit of experimentation and haphazard gestures built right in. For daily use, enjoy.")
    (license license:silofl1.1)))

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



;; git fetch

;; (define-public font-
;;   (package
;;     (name "font-")
;;     (version "1")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "")
;;              (commit "")))
;;        (sha256
;;         (base32 ""))))
;;     (build-system font-build-system)
;;     (home-page "")
;;     (synopsis
;;      ""
;;     (description
;;      "")
;;     (license license:silofl1.1)))

;; url fetch

;; (define-public font-
;;   (package
;;     (name "font-")
;;     (version "1")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri "")
;;        (sha256
;;         (base32 ""))))
;;     (build-system font-build-system)
;;     (home-page "")
;;     (synopsis
;;      "")
;;     (description
;;      "")
;;     (license license:silofl1.1)))
