;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2024 nik gaffney <nik@fo.am>
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

(define-module (zzkt packages soupault)
  #:use-module (guix)
  #:use-module (guix build-system dune)
  #:use-module (guix build-system ocaml)
  #:use-module (gnu packages ocaml)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix git-download)
  #:use-module ((guix licenses)
                #:prefix license:))

;; v5.2.1
;; https://codeberg.org/PataphysicalSociety/soupault/archive/5.2.1.tar.gz
;; 069nldh8ngakkyksi0w9d9jiczlf403skz4k3g6xwdf40vfrflwg

;; v4.11.0
;; https://codeberg.org/PataphysicalSociety/soupault/archive/4.11.0.tar.gz
;; 05d3rb9b89qmmlpzia6vplrw1gvcm1phbnf3mi58127f5ziz2lsv

;; v4.7.0
;; https://github.com/ocaml/opam-source-archives/raw/main/soupault.4.7.0.tar.gz
;; 0y4dlifiqs4x3w87lkfdiw0i89v8j69ax5mxp7g6lq0h40g8n4i6

;; v4.6.0
;; https://github.com/ocaml/opam-source-archives/raw/main/soupault.4.6.0.tar.gz
;; 1rc1jqri24ib5w109y8ffl9k835b6s9cyxj0s2px7aabwsf3iidf

(define-public soupault
  (package
    (name "soupault")
    (version "4.11.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://codeberg.org/PataphysicalSociety/soupault/archive/4.11.0.tar.gz")
       (sha256
        (base32 "05d3rb9b89qmmlpzia6vplrw1gvcm1phbnf3mi58127f5ziz2lsv"))))
        (build-system dune-build-system)
    (arguments
     `(#:tests? #f))
    (propagated-inputs (list
                        ocaml-containers
                        ocaml-fileutils
                        ocaml-logs
                        ocaml-fmt
                        ocaml-lambdasoup
                        ocaml-markup
                        ocaml-otoml
                        ocaml-ezjsonm
                        ocaml-yaml
                        ocaml-csv
                        ocaml-lwt
                        ocaml-re
                        ocaml-odate
                        ocaml-spelll
                        ocaml-base64
                        ocaml-jingoo
                        ocaml-camomile2
                        ocaml-digestif
                        ocaml-tsort
                        ocaml-lua-ml))
    (home-page "https://www.soupault.app"
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

;; required ocaml packages not (yet) in guix as of 2026-01-20
;;
;; containers -> ocaml-containers
;; lambdasoup -> ocaml-lambdasoup
;; otoml -> ocaml-otoml
;; odate -> ocaml-odate
;; spelll -> ocaml-spelll
;; jingoo -> ocaml-jingoo
;; tsort -> ocaml-tsort
;; lua-ml -> ocaml-lua-ml
;; menhirLib -> ocaml-menhirLib
;; iter -> ocaml-iter
;; stdlib-random -> ocaml-stdlib-random

;; required updates
;; ocaml-camomile 1.0.2 -> 2.0.0 (and depends) -> ocaml-camomile2

;; substitutes
;; ocaml-qcheck-core -> ocaml-qcheck

(define-public ocaml-stdlib-random
  (package
    (name "ocaml-stdlib-random")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://github.com/ocaml/stdlib-random/archive/refs/tags/1.2.0.tar.gz")
       (sha256
        (base32 "00ybbmx623hkx431frqy5bgnlfwn5m70b8af3hz2varvp279aydl"))))
    (build-system dune-build-system)
    (propagated-inputs (list ocaml-cppo ocaml-odoc))
    (home-page "https://github.com/ocaml/stdlib-random")
    (synopsis "Versioned Random module from the OCaml standard library")
    (description
     "The stdlib-random package provides a stable and compiler-independent
implementation of all the PRNGs used in the Random module.  Those PRNGs are
available in the various libraries: - stdlib-random.v3: OCaml 3.07 to 3.11 PRNG
- stdlib-random.v4: OCaml 3.12 to 4.14 PRNG - stdlib-random.v5: current OCaml
5.0 PRNG - stdlib-random.v5o: pure OCaml version of the OCaml 5 PRNG All those
libraries can be used together and the signature of their Random$n module has
been extended to the latest signature whenever possible.")
    (license #f)))


(define-public ocaml-camomile2
  (package
    (name "ocaml-camomile2")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://github.com/savonet/Camomile/archive/refs/tags/v2.0.0.tar.gz")
       (sha256
        (base32 "0gfhpwh039jgf9bdjwz3dxbjs0h90qd100nrbp5llnc1pg823d3b"))))
    (build-system dune-build-system)
    (propagated-inputs (list dune-site ocaml-camlp-streams ocaml-odoc))
    (native-inputs (list ocaml-stdlib-random))
    (home-page "https://github.com/savonet/Camomile")
    (synopsis "A Unicode library")
    (description
     "Camomile is a Unicode library for OCaml.  Camomile provides Unicode character
type, UTF-8, UTF-16, UTF-32 strings, conversion to/from about 200 encodings,
collation and locale-sensitive case mappings, and more.  The library is
currently designed for Unicode Standard 3.2.")
    (license #f)))


(define-public ocaml-iter
  (package
    (name "ocaml-iter")
    (version "1.9")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://github.com/c-cube/iter/releases/download/v1.9/iter-1.9.tbz")
       (sha256
        (base32 "0s79qwsj0gjs37qib3vkly2a4iv78ylv4djc0nq0s39f2nxybafv"))))
    (build-system dune-build-system)
    (propagated-inputs (list ocaml-odoc))
    (native-inputs (list ocaml-qcheck ocaml-ounit2 ocaml-mdx))
    (home-page "https://github.com/c-cube/iter/")
    (synopsis
     "Simple abstraction over `iter` functions, intended to iterate efficiently on collections while performing some transformations")
    (description #f)
    (license license:bsd-2)))


(define-public ocaml-menhirLib
  (package
    (name "ocaml-menhirLib")
    (version "20250912")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://gitlab.inria.fr/fpottier/menhir/-/archive/20250912/archive.tar.gz")
       (sha256
        (base32 "0x7ki5975xd3ma4j6i105g838hn7q5awi24i06fl1rbv2lwwimnr"))))
    (build-system dune-build-system)
    (home-page "http://gitlab.inria.fr/fpottier/menhir")
    (synopsis "Runtime support library for parsers generated by Menhir")
    (description #f)
    (license #f)))


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


(define-public ocaml-tsort
  (package
    (name "ocaml-tsort")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://github.com/dmbaturin/ocaml-tsort/archive/refs/tags/2.2.0.tar.gz")
       (sha256
        (base32 "0rqi0zay5dfswn0d6k8jjdk4rpgzi4d1wxq6ha6h68c8xv6x0df1"))))
    (build-system dune-build-system)
    (native-inputs (list ocaml-alcotest))
    (home-page "https://github.com/dmbaturin/ocaml-tsort")
    (synopsis "Easy to use and user-friendly topological sort")
    (description
     "Easy to use and user-friendly topological sort.  Example: ``` Tsort.sort
[(\"foundation\", []); (\"walls\", [\"foundation\"]); (\"roof\", [\"walls\"])] ```.")
    (license license:expat)))


(define-public ocaml-jingoo
  (package
    (name "ocaml-jingoo")
    (version "1.5.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/tategakibunko/jingoo/archive/1.5.1.tar.gz")
       (sha256
        (base32 "051d3c7a3cw1ir8xr084i0zp24i3w1r3zgsv2969y329s9vywp3g"))))
    (build-system dune-build-system)
    (propagated-inputs (list ocaml-menhir ocaml-ppx-deriving ocaml-re
                             ocaml-uutf ocaml-uucp))
    (native-inputs (list ocaml-ounit))
    (home-page "https://github.com/tategakibunko/jingoo")
    (synopsis
     "Template engine almost compatible with Jinja2(python template engine)")
    (description #f)
    (license license:bsd-3)))


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


(define-public ocaml-odate
  (package
    (name "ocaml-odate")
    (version "0.7")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://github.com/hhugo/odate/releases/download/0.7/odate-0.7.tbz")
       (sha256
        (base32 "1bsmix8qbsk04a1l2x4lrh919xq6a3pmanvgkdlc5wwp3p42q6bl"))))
    (build-system dune-build-system)
    (arguments
     `(#:tests? #f))
    (propagated-inputs (list ocaml-menhir))
    (native-inputs (list ocaml-ppx-expect))
    (home-page "https://github.com/hhugo/odate")
    (synopsis "Date & Duration Library")
    (description
     "Simple date and duration manipulation.  Also implement duration printer based on
string format.  Already implemented in opalang [http://opalang.org/].  For
documentation about the format, see :
[http://doc.opalang.org/value/stdlib.core.date/Duration/try_generate_printer].")
    (license license:expat)))

(define-public ocaml-otoml
  (package
    (name "ocaml-otoml")
    (version "1.0.5")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://github.com/dmbaturin/otoml/archive/refs/tags/1.0.5.tar.gz")
       (sha256
        (base32 "17aq7012n5yxs7kxv12g4aw4ic215zmrs3lpk6kya2zb5q5cq0fl"))))
    (build-system dune-build-system)
    (propagated-inputs (list ocaml-menhir ocaml-uutf ocaml-odoc))
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


(define-public ocaml-lambdasoup
  (package
    (name "ocaml-lambdasoup")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/aantron/lambdasoup/archive/1.1.1.tar.gz")
       (sha256
        (base32 "1zhhizim7zwxlv2r748hf1vwzgdpvzkdplyqdqbk391lwlw7zn85"))))
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


(define-public ocaml-containers
  (package
    (name "ocaml-containers")
    (version "3.17")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://github.com/c-cube/ocaml-containers/releases/download/v3.17/containers-3.17.tbz")
       (sha256
        (base32 "1fhw9x29zklfwqclr5gid6fncvvslim204mf06zh5716cx484w0g"))))
    (build-system dune-build-system)
    (propagated-inputs (list ocaml-either dune-configurator ocaml-odoc))
    (native-inputs (list ocaml-qcheck
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
