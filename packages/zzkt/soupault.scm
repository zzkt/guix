;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2024 nik gaffney <nik@fo.am>
;;;
;;; This file is (not yet) part of GNU Guix.
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

;;; via unofficial channels
;;;  https://repo.fo.am/zzkt/guix

(define-module (zzkt soupault)
  #:use-module (guix)
  #:use-module (guix build-system dune)
  #:use-module (guix build-system ocaml)
  #:use-module (gnu packages ocaml)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:))

;; v4.7.0
;; https://github.com/ocaml/opam-source-archives/raw/main/soupault.4.7.0.tar.gz
;; 0y4dlifiqs4x3w87lkfdiw0i89v8j69ax5mxp7g6lq0h40g8n4i6

;; v4.6.0
;; https://github.com/ocaml/opam-source-archives/raw/main/soupault.4.6.0.tar.gz
;; 1rc1jqri24ib5w109y8ffl9k835b6s9cyxj0s2px7aabwsf3iidf

(define-public soupault
  (package
   (name "soupault")
   (version "4.6.0")
   (source
    (origin
     (method url-fetch)
     (uri
      "https://github.com/ocaml/opam-source-archives/raw/main/soupault.4.6.0.tar.gz")
     (sha256
      (base32 "1rc1jqri24ib5w109y8ffl9k835b6s9cyxj0s2px7aabwsf3iidf"))))
   (build-system dune-build-system)
   (arguments
    `(#:tests? #f))
   (propagated-inputs (list ocaml-containers
                            ocaml-fileutils
                            ocaml-logs
                            ocaml-fmt
                            ocaml-lambdasoup
                            ocaml-markup
                            ocaml-otoml
                            ocaml-ezjsonm
                            ocaml-yaml
                            ocaml-csv
                            ocaml-re
                            ocaml-odate
                            ocaml-spelll
                            ocaml-base64
                            ocaml-jingoo
                            ocaml-camomile
                            ocaml-digestif
                            ocaml-tsort
                            ocaml-lua-ml))
   (home-page "https://www.soupault.app")
   (synopsis "Static website generator based on HTML rewriting")
   (description
    "This package provides a website generator that works with page element tree
rather than text and allows you to manipulate pages and retrieve metadata from
existing HTML using arbitrary CSS selectors.  With soupault you can: * Generate
@code{ToC} and footnotes. * Insert file content or an HTML snippet in any
element. * Preprocess element content with external programs (e.g. run `<pre>`
tags through a highlighter) * Extract page metadata (think microformats) and
render it using a Jingoo template or an external script. * Export extracted
metadata to JSON. Soupault is extensible with Lua (2.5) plugins and provides an
API for element tree manipulation, similar to web browsers.  The website
generator mode is optional, you can use it as post-processor for existing sites.")
   (license license:expat)))


;; ocaml packages not (yet) in guix as of 2024-01-04

;; ocaml-containers
;; ocaml-lambdasoup
;; ocaml-otoml
;; ocaml-yaml
;; ocaml-odate
;; ocaml-spelll
;; ocaml-jingoo
;; ocaml-tsort
;; ocaml-lua-ml
;; ocaml-qcheck-core
;; ocaml-iter

;; via guix import opam containers

(define-public ocaml-containers
  (package
   (name "ocaml-containers")
   (version "3.13.1")
   (source
    (origin
     (method url-fetch)
     (uri
      "https://github.com/c-cube/ocaml-containers/releases/download/v3.13.1/containers-3.13.1.tbz")
     (sha256
      (base32 "114pcswmscbh5mvniiarbk5jqma3kjs6w9bx2p2lzw1w5kmjd6zb"))))
   (build-system dune-build-system)
   (propagated-inputs (list ocaml-either dune-configurator ocaml-odoc))
   (native-inputs (list ocaml-qcheck-core
		        ocaml-yojson
		        ocaml-iter
		        ocaml-gen
		        ocaml-csexp
		        ocaml-uutf))
   (home-page "https://github.com/c-cube/ocaml-containers/")
   (synopsis
    "A modular, clean and powerful extension of the OCaml standard library")
   (description #f)
   (license license:bsd-2)))

;; via guix import opam lambdasoup


(define-public ocaml-lambdasoup
  (package
   (name "ocaml-lambdasoup")
   (version "1.0.0")
   (source
    (origin
     (method url-fetch)
     (uri "https://github.com/aantron/lambdasoup/archive/1.0.0.tar.gz")
     (sha256
      (base32 "1g5jr1s024z755slz5zg4cssmxqbva0d0nhn75wd09p45v7c94x3"))))
   (build-system dune-build-system)
   (propagated-inputs (list ocaml-camlp-streams ocaml-markup ocaml-bisect-ppx))
   (native-inputs (list ocaml-ounit2))
   (home-page "https://github.com/aantron/lambdasoup")
   (synopsis
    "Easy functional HTML scraping and manipulation with CSS selectors")
   (description
    "Lambda Soup is an HTML scraping library inspired by Python's Beautiful Soup.  It
provides lazy traversals from HTML nodes to their parents, children, siblings,
etc., and to nodes matching CSS selectors.  The traversals can be manipulated
using standard functional combinators such as fold, filter, and map.  The DOM
tree is mutable.  You can use Lambda Soup for automatic HTML rewriting in
scripts.  Lambda Soup rewrites its own ocamldoc page this way.  A major goal of
Lambda Soup is to be easy to use, including in interactive sessions, and to have
a minimal learning curve.  It is a very simple library.")
   (license license:expat)))

;; via guix import opam otoml

(define-public ocaml-otoml
  (package
   (name "ocaml-otoml")
   (version "1.0.4")
   (source
    (origin
     (method url-fetch)
     (uri "https://github.com/dmbaturin/otoml/archive/refs/tags/1.0.4.tar.gz")
     (sha256
      (base32 "1q4nq5sj31hhv0vwv3wd739scqd4ni80583dmny0ip1id4w7xkc8"))))
   (build-system dune-build-system)
   (propagated-inputs (list ocaml-menhir ocaml-menhirLib ocaml-uutf ocaml-odoc))
   (native-inputs (list ocaml-ounit2))
   (home-page "https://github.com/dmbaturin/otoml")
   (synopsis
    "TOML parsing, manipulation, and pretty-printing library (1.0.0-compliant)")
   (description
    "OTOML is a library for parsing, manipulating, and pretty-printing TOML files. *
Fully 1.0.0-compliant. * No extra dependencies: default implementation uses
native numbers and represents dates as strings. * Provides a functor for
building alternative implementations: plug your own bignum and calendar
libraries if required. * Informative parse error reporting. * Pretty-printer
offers flexible indentation options.")
   (license license:expat)))


;; via  guix import opam yaml

(define-public ocaml-yaml
  (package
   (name "ocaml-yaml")
   (version "3.2.0")
   (source
    (origin
     (method url-fetch)
     (uri
      "https://github.com/avsm/ocaml-yaml/releases/download/v3.2.0/yaml-3.2.0.tbz")
     (sha256
      (base32 "09w2l2inc0ymzd9l8gpx9pd4xlp5a4rn1qbi5dwndydr5352l3f5"))))
   (build-system dune-build-system)
   (propagated-inputs (list dune-configurator ocaml-ctypes ocaml-bos))
   (native-inputs (list ocaml-fmt
                        ocaml-logs
                        ocaml-mdx
                        ocaml-alcotest
                        ocaml-crowbar
                        ocaml-junit-alcotest
                        ocaml-ppx-sexp-value
                        ocaml-sexplib
                        ocaml-ezjsonm))
   (home-page "https://github.com/avsm/ocaml-yaml")
   (synopsis "Parse and generate YAML 1.1/1.2 files")
   (description
    "This is an OCaml library to parse and generate the YAML file format.  It is
intended to interoperable with the [Ezjsonm](https://github.com/mirage/ezjsonm)
JSON handling library, if the simple common subset of Yaml is used.  Anchors and
other advanced Yaml features are not implemented in the JSON compatibility
layer.")
   (license license:isc)))


;; via  guix import opam odate

(define-public ocaml-odate
  (package
   (name "ocaml-odate")
   (version "0.7")
   (source
    (origin
     (method url-fetch)
     (uri "https://github.com/hhugo/odate/releases/download/0.7/odate-0.7.tbz")
     (sha256
      (base32 "1bsmix8qbsk04a1l2x4lrh919xq6a3pmanvgkdlc5wwp3p42q6bl"))))
   (build-system dune-build-system)
   (arguments
    `(#:tests? #f))
   (propagated-inputs (list ocaml-menhir))
   (native-inputs (list ocaml-lwt ocaml-ppx-expect))
   (home-page "https://github.com/hhugo/odate")
   (synopsis "Date & Duration Library")
   (description
    "Simple date and duration manipulation.  Also implement duration printer based on
string format.")
   (license license:expat)))

;; via  guix import opam spelll

(define-public ocaml-spelll
  (package
   (name "ocaml-spelll")
   (version "0.4")
   (source
    (origin
     (method url-fetch)
     (uri "https://github.com/c-cube/spelll/archive/v0.4.tar.gz")
     (sha256
      (base32 "06sv8fm8ml6s1w005c0d0lsc58qhqhij5chks3fv541b2y2mcl5q"))))
   (build-system dune-build-system)
   (propagated-inputs (list ocaml-seq ocaml-stdlib-shims ocaml-odoc))
   (native-inputs (list ocaml-qcheck ocaml-mdx))
   (home-page "https://github.com/c-cube/spelll/")
   (synopsis "Fuzzy string searching, using Levenshtein automaton")
   (description #f)
   (license license:bsd-2)))

;; via  guix import opam jingoo

(define-public ocaml-jingoo
  (package
   (name "ocaml-jingoo")
   (version "1.5.0")
   (source
    (origin
     (method url-fetch)
     (uri "https://github.com/tategakibunko/jingoo/archive/1.5.0.tar.gz")
     (sha256
      (base32 "1sjq26dxh8vk184fn2md5r4ilnh7jj7baylg3f3j142l94ig6kwc"))))
   (build-system dune-build-system)
   (propagated-inputs (list ocaml-menhir ocaml-ppx-deriving ocaml-re ocaml-uutf
			    ocaml-uucp))
   (native-inputs (list ocaml-ounit))
   (home-page "https://github.com/tategakibunko/jingoo")
   (synopsis
    "Template engine almost compatible with Jinja2(python template engine)")
   (description #f)
   (license license:bsd-3)))

;; via  guix import opam tsort

(define-public ocaml-tsort
  (package
   (name "ocaml-tsort")
   (version "2.1.0")
   (source
    (origin
     (method url-fetch)
     (uri
      "https://github.com/dmbaturin/ocaml-tsort/archive/refs/tags/2.1.0.tar.gz")
     (sha256
      (base32 "16vy2x384ac3wr4vdfvc2dqnln6w5bgj4frwyi0h3rgnz9cz2w1q"))))
   (build-system dune-build-system)
   (home-page "https://github.com/dmbaturin/ocaml-tsort")
   (synopsis "Easy to use and user-friendly topological sort")
   (description
    "Easy to use and user-friendly topological sort.  Example: ``` Tsort.sort
[(\"foundation\", []); (\"walls\", [\"foundation\"]); (\"roof\", [\"walls\"])] ```")
   (license license:expat)))


;; via  guix import opam lua-ml

(define-public ocaml-lua-ml
  (package
   (name "ocaml-lua-ml")
   (version "0.9.4")
   (source
    (origin
     (method url-fetch)
     (uri "https://github.com/lindig/lua-ml/archive/refs/tags/0.9.4.tar.gz")
     (sha256
      (base32 "0za62jivmxrdwnnxdaad53sbryfsaj4zfqlfpdp98n9bpvsi4mad"))))
   (build-system dune-build-system)
   (propagated-inputs (list ocaml-odoc))
   (home-page "https://github.com/lindig/lua-ml")
   (synopsis "An embeddable Lua 2.5 interpreter implemented in OCaml")
   (description #f)
   (license license:bsd-2)))

;;  via guix import opam qcheck-core

(define-public ocaml-qcheck-core
  (package
   (name "ocaml-qcheck-core")
   (version "0.21.3")
   (source
    (origin
     (method url-fetch)
     (uri "https://github.com/c-cube/qcheck/archive/v0.21.3.tar.gz")
     (sha256
      (base32 "1ar416qlrb2qrnlm7vw7lzg860nrg9vw8p3rnx16xy8ryj6z5pix"))))
   (build-system dune-build-system)
   (propagated-inputs (list ocaml-ppxlib
                            ocaml-ounit2
                            ocaml-odoc))
   (native-inputs (list ocaml-alcotest))
   (home-page "https://github.com/c-cube/qcheck/")
   (synopsis "Core qcheck library")
   (description #f)
   (license license:bsd-2)))

;;  via guix import opam iter

(define-public ocaml-iter
  (package
   (name "ocaml-iter")
   (version "1.8")
   (source
    (origin
     (method url-fetch)
     (uri "https://github.com/c-cube/iter/releases/download/v1.8/iter-1.8.tbz")
     (sha256
      (base32 "08rhykcizbs21mri4zx1b6vg42a4wybl238cla5bmi79bah9qwzq"))))
   (build-system dune-build-system)
   (propagated-inputs (list ocaml-odoc))
   (native-inputs (list ocaml-qcheck-core ocaml-ounit2 ocaml-mdx))
   (home-page "https://github.com/c-cube/iter/")
   (synopsis
    "Simple abstraction over `iter` functions, intended to iterate efficiently on collections while performing some transformations")
   (description #f)
   (license license:bsd-2)))

;; via guix import opam menhirLib

(define-public ocaml-menhirLib
  (package
   (name "ocaml-menhirLib")
   (version "20230608")
   (source
    (origin
     (method url-fetch)
     (uri
      "https://gitlab.inria.fr/fpottier/menhir/-/archive/20230608/archive.tar.gz")
     (sha256
      (base32 "13mb862c20m1q7vjsa5lgqj3w6b0xhj8ckjyk524wrc4i0s1jzix"))))
   (build-system dune-build-system)
   (arguments
    `(#:tests? #f))
   (home-page "http://gitlab.inria.fr/fpottier/menhir")
   (synopsis "Runtime support library for parsers generated by Menhir")
   (description #f)
   (license #f)))

;; via  guix import opam junit

(define-public ocaml-junit
  (package
   (name "ocaml-junit")
   (version "2.0.2")
   (source
    (origin
     (method url-fetch)
     (uri
      "https://github.com/Khady/ocaml-junit/releases/download/2.0.2/junit-2.0.2.tbz")
     (sha256
      (base32 "00bbx5j8vsy9fqbc04xa3lsalaxicirmbczr65bllfk1afv43agx"))))
   (build-system dune-build-system)
   (arguments
    `(#:tests? #f))
   (propagated-inputs (list ocaml-ptime
                            ocaml-tyxml
                            ocaml-odoc
                            ocaml-ounit
                            ocaml-alcotest))
   (home-page "https://github.com/Khady/ocaml-junit")
   (synopsis "JUnit XML reports generation library")
   (description "JUnit XML reports generation library")
   (license #f)))

;; via guix import opam junit_alcotest

(define-public ocaml-junit-alcotest
  (package
   (name "ocaml-junit-alcotest")
   (version "2.0.2")
   (source
    (origin
     (method url-fetch)
     (uri
      "https://github.com/Khady/ocaml-junit/releases/download/2.0.2/junit-2.0.2.tbz")
     (sha256
      (base32 "00bbx5j8vsy9fqbc04xa3lsalaxicirmbczr65bllfk1afv43agx"))))
   (build-system dune-build-system)
   (arguments
    `(#:tests? #f))
   (propagated-inputs (list ocaml-odoc ocaml-alcotest ocaml-junit))
   (properties `((upstream-name . "junit_alcotest")))
   (home-page "https://github.com/Khady/ocaml-junit")
   (synopsis "JUnit XML reports generation for alcotest tests")
   (description "JUnit XML reports generation for alcotest tests")
   (license #f)))

;; via guix import opam junit_ounit

(define-public ocaml-junit-ounit
  (package
   (name "ocaml-junit-ounit")
   (version "2.0.2")
   (source
    (origin
     (method url-fetch)
     (uri
      "https://github.com/Khady/ocaml-junit/releases/download/2.0.2/junit-2.0.2.tbz")
     (sha256
      (base32 "00bbx5j8vsy9fqbc04xa3lsalaxicirmbczr65bllfk1afv43agx"))))
   (build-system dune-build-system)
   (arguments
    `(#:tests? #f))
   (propagated-inputs (list ocaml-odoc ocaml-ounit ocaml-junit))
   (properties `((upstream-name . "junit_ounit")))
   (home-page "https://github.com/Khady/ocaml-junit")
   (synopsis "JUnit XML reports generation for OUnit tests")
   (description "JUnit XML reports generation for OUnit tests")
   (license #f)))


;; via guix import opam junit_camomile
;; note: camomile 1.0.2 is currently available in guix

(define-public ocaml-camomile
  (package
   (name "ocaml-camomile")
   (version "2.0.0")
   (source
    (origin
     (method url-fetch)
     (uri
      "https://github.com/savonet/Camomile/archive/refs/tags/v2.0.0.tar.gz")
     (sha256
      (base32 "0gfhpwh039jgf9bdjwz3dxbjs0h90qd100nrbp5llnc1pg823d3b"))))
   (build-system dune-build-system)
   (propagated-inputs (list ocaml-dune-site
                            ocaml-camlp-streams
                            ocaml-odoc))
   ;; (native-inputs (list ocaml-stdlib-random))
   (home-page "https://github.com/savonet/Camomile")
   (synopsis "A Unicode library")
   (description
    "Camomile is a Unicode library for OCaml.  Camomile provides Unicode character
type, UTF-8, UTF-16, UTF-32 strings, conversion to/from about 200 encodings,
collation and locale-sensitive case mappings, and more.  The library is
currently designed for Unicode Standard 3.2.")
   (license #f)))

;; via guix import opam dune-site

(define-public ocaml-dune-site
  (package
   (name "ocaml-dune-site")
   (version "3.12.2")
   (source
    (origin
     (method url-fetch)
     (uri
      "https://github.com/ocaml/dune/releases/download/3.12.2/dune-3.12.2.tbz")
     (sha256
      (base32 "1csz543wq66dcn08piabaascvbiswb1vxw1xfg4glgp8zq0mzap8"))))
   (build-system dune-build-system)
   (propagated-inputs (list dune
                            ocaml-base
                            ocaml-odoc))
   (home-page "https://github.com/ocaml/dune")
   (synopsis "Embed locations information inside executable and libraries")
   (description #f)
   (license license:expat)))

;; via guix import opam lwt
;; note: v5.6 is currently available in guix
;; see also https://git.savannah.gnu.org/cgit/guix.git/tree/gnu/packages/ocaml.scm#n2800

(define-public ocaml-lwt
  (package
   (name "ocaml-lwt")
   (version "5.7.0")
   (source
    (origin
     (method url-fetch)
     (uri "https://github.com/ocsigen/lwt/archive/refs/tags/5.7.0.tar.gz")
     (sha256
      (base32 "11dpr0aprqqjgb2n4j4czpw3l0bc8dzy1jqmp2qz3xkih31k241p"))))
   (build-system dune-build-system)
   (arguments
     `(#:package "lwt"))
    (native-inputs
     (list ocaml-cppo ocaml-base pkg-config))
    (inputs
     (list glib))
    (propagated-inputs
     (list ocaml-mmap ocaml-ocplib-endian ocaml-result ocaml-seq libev))
   ;; (propagated-inputs (list dune-configurator ocaml-ocplib-endian))
   ;; (native-inputs (list ocaml-cppo))
   (home-page "https://github.com/ocsigen/lwt")
   (synopsis "Promises and event-driven I/O")
   (description
    "This package provides a promise is a value that may become determined in the
future.  Lwt provides typed, composable promises.  Promises that are resolved by
I/O are resolved by Lwt in parallel.  Meanwhile, OCaml code, including code
creating and waiting on promises, runs in a single thread by default.  This
reduces the need for locks or other synchronization primitives.  Code can be run
in parallel on an opt-in basis.")
   (license license:expat)))

;; via guix import opam base

(define-public ocaml-base
(package
  (name "ocaml-base")
  (version "0.16.3")
  (source
   (origin
     (method url-fetch)
     (uri
      "https://github.com/janestreet/base/archive/refs/tags/v0.16.3.tar.gz")
     (sha256
      (base32 "0g7rrwnd3sb4pcpnvq7hc7dd7rg1gh0axxdhqwjh60dxw81ybycv"))))
  (build-system dune-build-system)
  (propagated-inputs (list ocaml-sexplib0@0.16.0 dune-configurator))
  (home-page "https://github.com/janestreet/base")
  (synopsis "Full standard library replacement for OCaml")
  (description
   "Full standard library replacement for OCaml Base is a complete and portable
alternative to the OCaml standard library.  It provides all standard
functionalities one would expect from a language standard library.  It uses
consistent conventions across all of its module.  Base aims to be usable in any
context.  As a result system dependent features such as I/O are not offered by
Base.  They are instead provided by companion libraries such as stdio:
https://github.com/janestreet/stdio")
  (license license:expat)))

;; via guix import opam sexplib0

(define-public ocaml-sexplib0
(package
  (name "ocaml-sexplib0")
  (version "0.16.0")
  (source
   (origin
     (method url-fetch)
     (uri
      "https://ocaml.janestreet.com/ocaml-core/v0.16/files/sexplib0-v0.16.0.tar.gz")
     (sha256
      (base32 "07bhj2akd6i33h11qin4wns9qnjicf871yzji7vi4i8rd1ja5nw6"))))
  (build-system dune-build-system)
  (home-page "https://github.com/janestreet/sexplib0")
  (synopsis
   "Library containing the definition of S-expressions and some base converters")
  (description
   "Part of Jane Street's Core library The Core suite of libraries is an industrial
strength alternative to OCaml's standard library that was developed by Jane
Street, the largest industrial user of OCaml.")
  (license license:expat)))
