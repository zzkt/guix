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

;; tidal(cycles)
;;
;; run time depends
;; - supercollider
;; - https://github.com/musikinformatik/SuperDirt

(define-module (zzkt tidal)
  #:use-module (guix)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system haskell)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages haskell-apps)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-xyz))

(define-public tidal
  (package
   (name "tidal")
   (version "1.9.4")
   (source
    (origin
     (method url-fetch)
     (uri (hackage-uri "tidal" version))
     (sha256
      (base32 "126p05lqlq8q03gdhqq378dirs5imfkk9csaf797jz1j6lcwbnv1"))))
   (build-system haskell-build-system)
   (properties '((upstream-name . "tidal")))
   (inputs (list ghc-colour
		 ghc-hosc
		 ghc-network
		 ghc-clock
		 ghc-primitive
		 ghc-random
		 ghc-tidal-link))
   (native-inputs (list ghc-microspec))
   (arguments
    `(#:cabal-revision ("2"
			"12v805xy9nqfyn9ryqxlslqiffb6havpixi23xkmk0annbxcf8k2")))
   (home-page "http://tidalcycles.org/")
   (synopsis "Pattern language for improvised music")
   (description "Tidal is a domain specific language for live coding patterns.")
   (license license:gpl3)))

(define-public ghc-tidal-link
  (package
   (name "ghc-tidal-link")
   (version "1.0.1")
   (source
    (origin
     (method url-fetch)
     (uri (hackage-uri "tidal-link" version))
     (sha256
      (base32 "0s3x73zx4rxjawcf2744z9dr05j4pabbxddrz9814h1d61q2cbb1"))))
   (build-system haskell-build-system)
   (properties '((upstream-name . "tidal-link")))
   (home-page "http://tidalcycles.org/")
   (synopsis "Ableton Link integration for Tidal")
   (description
    "Ableton Link integration for Tidal, to let Tidal sync with external clocks")
   (license #f)))


;; hackage dependencies not in guix as of 2023-12-01
;; - ghc-hosc
;; - ghc-data-binary-ieee754

(define-public ghc-hosc
  (package
   (name "ghc-hosc")
   (version "0.20")
   (source
    (origin
     (method url-fetch)
     (uri (hackage-uri "hosc" version))
     (sha256
      (base32 "17pvv6rgl74ymq7pazxqia19smsga53kkg5h1i1dgfpikrmq7fz9"))))
   (build-system haskell-build-system)
   (properties '((upstream-name . "hosc")))
   (inputs (list ghc-blaze-builder
		 ghc-data-binary-ieee754
		 ghc-network))
   (home-page "http://rohandrape.net/t/hosc")
   (synopsis "Haskell Open Sound Control")
   (description "Haskell library implementing the Open Sound Control protocol")
   (license #f)))

(define-public ghc-data-binary-ieee754
  (package
   (name "ghc-data-binary-ieee754")
   (version "0.4.4")
   (source
    (origin
     (method url-fetch)
     (uri (hackage-uri "data-binary-ieee754" version))
     (sha256
      (base32 "02nzg1barhqhpf4x26mpzvk7jd29nali033qy01adjplv2z5m5sr"))))
   (build-system haskell-build-system)
   (properties '((upstream-name . "data-binary-ieee754")))
   (home-page "https://john-millikin.com/software/data-binary-ieee754/")
   (synopsis "Parser/Serialiser for IEEE-754 floating-point values")
   (description "Convert Float and Decimal values to/from raw octets.")
   (license license:expat)))

(define-public ghc-microspec
  (package
   (name "ghc-microspec")
   (version "0.2.1.3")
   (source
    (origin
     (method url-fetch)
     (uri (hackage-uri "microspec" version))
     (sha256
      (base32 "0615gdbsk7i3w71adjp69zabw4mli965wffm2h846hp6pjj31xcb"))))
   (build-system haskell-build-system)
   (properties '((upstream-name . "microspec")))
   (inputs (list ghc-quickcheck))
   (home-page "http://hackage.haskell.org/package/microspec")
   (synopsis "Tiny QuickCheck test library with minimal dependencies")
   (description
    "This package provides a tiny (1 module, <500 lines) property-based (and unit)
testing library with minimal dependencies. .  Instead of reinventing the wheel
(<https://xkcd.com/927>), we use a RSpec/HSpec-like DSL and run tests with
@code{QuickCheck}. .  For many use-cases, microspec is a drop-in replacement for
hspec. . > import Test.Microspec > > main :: IO () > main = microspec $ do >
describe \"replicate\" $ do > it \"doubles with 2\" $ > replicate 2 x === \"xx\" > it
\"creates a list of the right size\" $ > \\(Positive n) -> length (replicate n x')
=== n > > describe \"reverse\" $ do > it \"reverse .  reverse === id\" $ \\l -> >
reverse (reverse l) === (l :: [Int]) > > describe \"tail\" $ > it \"length is -1\" $
\\(@code{NonEmpty} l) -> > length (tail l :: [Int]) === length l - 1 > > describe
\"solve the halting problem\" $ > pending")
   (license license:bsd-3)))

;; superdirt via -> https://github.com/musikinformatik/SuperDirt

(define-public superdirt
  (package
   (name "superdirt")
   (version "1.7.3")
   (source
    (origin
     (method url-fetch)
     (uri "https://github.com/musikinformatik/SuperDirt/archive/refs/tags/v1.7.3.tar.gz")
     (sha256 (base32 "16pl3z7979j2az8xcjglxz7rmn9rnm8mll5gns3fj193yp3w18iv"))))
   (inputs
    (list supercollider))
   (propagated-inputs
    (list supercollider))
   (build-system gnu-build-system)
   (arguments (list #:configure-flags #~(list "--enable-silent-rules")))
   (home-page "https://github.com/musikinformatik/SuperDirt/")
   (synopsis "Tidal Audio Engine")
   (description "SuperCollider implementation of the Dirt sampler, originally designed for the TidalCycles environment. SuperDirt is a general purpose framework for playing samples and synths, controllable over the Open Sound Control protocol, and locally from the SuperCollider language.")
   (license license:gpl3+)))
