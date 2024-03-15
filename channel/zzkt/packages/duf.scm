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


;; https://github.com/muesli/duf

(define-module (zzkt packages duf)
  #:use-module (guix)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (guix build-system go)
  #:use-module (guix git-download)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages golang-xyz)
  #:use-module (gnu packages golang-check)
  #:use-module (gnu packages golang-build))

(define-public duf
  (package
    (name "duf")
    (version "git")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/muesli/duf")
              (commit "ae480f3d59342a8963ffb7b4a5070a32086314fb")))
        (file-name (git-file-name name version))
        (sha256 (base32 "0kznsn94ar45y1la91slgvh8iv64vxp3pmwj744alsxckw846x92"))))
    (inputs
     (list go-github-com-iglou-eu-go-wildcard
           go-github-com-mattn-go-runewidth
           go-github-com-jedib0t-go-pretty-v6
           go-github-com-muesli-mango
           go-github-com-muesli-roff
           go-github-com-muesli-termenv
           go-golang-org-x-sys
           go-golang-org-x-term
           ))

;; require (
;; 	github.com/aymanbagabas/go-osc52/v2 v2.0.1 // indirect
;; 	github.com/lucasb-eyer/go-colorful v1.2.0 // indirect
;; 	github.com/mattn/go-isatty v0.0.17 // indirect
;; 	github.com/rivo/uniseg v0.2.0 // indirect
;; )
    (arguments
     (list
      #:import-path "https://github.com/muesli/duf"))
    (build-system go-build-system)
    (home-page "https://www.gnu.org/software/hello/")
    (synopsis "Disk Usage/Free Utility. A better 'df' alternative")
    (description "Disk Usage/Free Utility. Features include; User-friendly, colorful output; Adjusts to your terminal's theme & width; Sort the results according to your needs; Groups & filters devices; Can conveniently output JSON.")
    (license license:expat)))

;; dependencies


(define-public go-github-com-iglou-eu-go-wildcard
  (package
    (name "go-github-com-iglou-eu-go-wildcard")
    (version "1.0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/IGLOU-EU/go-wildcard")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1navfgv8k4lk0ajd8xib75qzjiingbh9xfhrh1qdxin5cycrn1al"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/IGLOU-EU/go-wildcard"))
    (home-page "https://github.com/IGLOU-EU/go-wildcard")
    (synopsis "Go-wildcard")
    (description
     "This part of Minio project is a very cool, fast and light wildcard pattern
matching.")
    (license license:asl2.0)))


;; guix import go --recursive github.com/jedib0t/go-pretty/v6

(define-public go-github-com-chromedp-sysutil
  (package
    (name "go-github-com-chromedp-sysutil")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/chromedp/sysutil")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0vczhxgnvfkw1h12rbyyllcgwa1rmhn5x4iq20sm7dld26rglh5b"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/chromedp/sysutil"))
    (home-page "https://github.com/chromedp/sysutil")
    (synopsis "About sysutil")
    (description
     "Package sysutil provides some utilities for working with cross platform systems.")
    (license license:expat)))

(define-public go-github-com-chromedp-cdproto
  (package
    (name "go-github-com-chromedp-cdproto")
    (version "0.0.0-20240312231614-1e5096e63154")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/chromedp/cdproto")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pqnp6203qavmnpj2rxl58mipfmkz493pcl3440bkvqm0jwkkc99"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/chromedp/cdproto"))
    (propagated-inputs `(("go-github-com-mailru-easyjson" ,go-github-com-mailru-easyjson)
                         ("go-github-com-chromedp-sysutil" ,go-github-com-chromedp-sysutil)))
    (home-page "https://github.com/chromedp/cdproto")
    (synopsis "About cdproto")
    (description
     "Package cdproto provides the Chrome @code{DevTools} Protocol commands, types,
and events for the cdproto domain.")
    (license license:expat)))

(define-public go-github-com-gobwas-httphead
  (package
    (name "go-github-com-gobwas-httphead")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gobwas/httphead")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "106l8ml5yihld3rrf45q5fhlsx64hrpj2dsvnnm62av4ya5nf0gb"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/gobwas/httphead"))
    (home-page "https://github.com/gobwas/httphead")
    (synopsis "httphead.")
    (description
     "Package httphead contains utils for parsing HTTP and HTTP-grammar compatible
text protocols headers.")
    (license license:expat)))

(define-public go-github-com-gobwas-pool
  (package
    (name "go-github-com-gobwas-pool")
    (version "0.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gobwas/pool")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0imipsf8nslc78in78wcri2ir2zzajp2h543dp2cshrrdbwkybx7"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/gobwas/pool"))
    (home-page "https://github.com/gobwas/pool")
    (synopsis "pool")
    (description
     "Package pool contains helpers for pooling structures distinguishable by size.")
    (license license:expat)))

(define-public go-github-com-gobwas-ws
  (package
    (name "go-github-com-gobwas-ws")
    (version "1.3.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gobwas/ws")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1fdx14lqzjin18n604b9mmr1dq7s19yz13zk7vrbvj7inwcjqzy6"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/gobwas/ws"))
    (propagated-inputs `(("go-github-com-gobwas-pool" ,go-github-com-gobwas-pool)
                         ("go-github-com-gobwas-httphead" ,go-github-com-gobwas-httphead)))
    (home-page "https://github.com/gobwas/ws")
    (synopsis "ws")
    (description
     "Package ws implements a client and server for the @code{WebSocket} protocol as
specified in @@url{https://rfc-editor.org/rfc/rfc6455.html,RFC 6455}.")
    (license license:expat)))

(define-public go-github-com-ledongthuc-pdf
  (package
    (name "go-github-com-ledongthuc-pdf")
    (version "0.0.0-20240201131950-da5b75280b06")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ledongthuc/pdf")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0c1b2sxvxwpvv9b5xawr8i2dl2d6xlcdi7bdjjg0nbvxgh74269f"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/ledongthuc/pdf"))
    (home-page "https://github.com/ledongthuc/pdf")
    (synopsis "PDF Reader")
    (description "Package pdf implements reading of PDF files.")
    (license license:bsd-3)))

(define-public go-github-com-josharian-intern
  (package
    (name "go-github-com-josharian-intern")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/josharian/intern")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1za48ppvwd5vg8vv25ldmwz1biwpb3p6qhf8vazhsfdg9m07951c"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/josharian/intern"))
    (home-page "https://github.com/josharian/intern")
    (synopsis #f)
    (description
     "Package intern interns strings.  Interning is best effort only.  Interned
strings may be removed automatically at any time without notification.  All
functions may be called concurrently with themselves and each other.")
    (license license:expat)))

(define-public go-github-com-mailru-easyjson
  (package
    (name "go-github-com-mailru-easyjson")
    (version "0.7.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mailru/easyjson")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0clifkvvy8f45rv3cdyv58dglzagyvfcqb63wl6rij30c5j2pzc1"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/mailru/easyjson"))
    (propagated-inputs `(("go-github-com-josharian-intern" ,go-github-com-josharian-intern)))
    (home-page "https://github.com/mailru/easyjson")
    (synopsis "easyjson")
    (description
     "Package easyjson contains marshaler/unmarshaler interfaces and helper functions.")
    (license license:expat)))

(define-public go-github-com-chromedp-chromedp
  (package
    (name "go-github-com-chromedp-chromedp")
    (version "0.9.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/chromedp/chromedp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ballxw8l0cy2z467nshfflwyf7lhy7ng2q9w6k7kgnrrg8mb351"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/chromedp/chromedp"))
    (propagated-inputs `(("go-github-com-orisano-pixelmatch" ,go-github-com-orisano-pixelmatch)
                         ("go-github-com-mailru-easyjson" ,go-github-com-mailru-easyjson)
                         ("go-github-com-ledongthuc-pdf" ,go-github-com-ledongthuc-pdf)
                         ("go-github-com-gobwas-ws" ,go-github-com-gobwas-ws)
                         ("go-github-com-chromedp-cdproto" ,go-github-com-chromedp-cdproto)))
    (home-page "https://github.com/chromedp/chromedp")
    (synopsis "About chromedp")
    (description
     "Package chromedp is a high level Chrome @code{DevTools} Protocol client that
simplifies driving browsers for scraping, unit testing, or profiling web pages
using the CDP.")
    (license license:expat)))

(define-public go-github-com-chzyer-test
  (package
    (name "go-github-com-chzyer-test")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/chzyer/test")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1axdlcnx2qjsn5wsr2pr1m0w0a8k4nk5kkrngh742fgh81vzzy8s"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/chzyer/test"))
    (propagated-inputs `(("go-github-com-chzyer-logex" ,go-github-com-chzyer-logex)))
    (home-page "https://github.com/chzyer/test")
    (synopsis "test")
    (description #f)
    (license license:expat)))

(define-public go-github-com-chzyer-logex
  (package
    (name "go-github-com-chzyer-logex")
    (version "1.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/chzyer/logex")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0c9yr3r7dl3lcs22cvmh9iknihi9568wzmdywmc2irkjdrn8bpxw"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/chzyer/logex"))
    (home-page "https://github.com/chzyer/logex")
    (synopsis "Logex")
    (description
     "An golang log lib, supports tracing and level, wrap by standard log lib")
    (license license:expat)))

(define-public go-github-com-chzyer-readline
  (package
    (name "go-github-com-chzyer-readline")
    (version "1.5.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/chzyer/readline")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1msh9qcm7l1idpmfj4nradyprsr86yhk9ch42yxz7xsrybmrs0pb"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/chzyer/readline"))
    (propagated-inputs `(("go-github-com-chzyer-logex" ,go-github-com-chzyer-logex)
                         ("go-golang-org-x-sys" ,go-golang-org-x-sys)
                         ("go-github-com-chzyer-test" ,go-github-com-chzyer-test)))
    (home-page "https://github.com/chzyer/readline")
    (synopsis "Guide")
    (description
     "Readline is a pure go implementation for GNU-Readline kind library.")
    (license license:expat)))

(define-public go-github-com-ianlancetaylor-demangle
  (package
    (name "go-github-com-ianlancetaylor-demangle")
    (version "0.0.0-20240312041847-bd984b5ce465")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ianlancetaylor/demangle")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1g52ly5xpfx49c03cj2gac03pg1dvmsa7fkp85f9n4jz27j486gj"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/ianlancetaylor/demangle"))
    (home-page "https://github.com/ianlancetaylor/demangle")
    (synopsis "github.com/ianlancetaylor/demangle")
    (description
     "Package demangle defines functions that demangle GCC/LLVM C++ and Rust symbol
names.  This package recognizes names that were mangled according to the C++ ABI
defined at
@@url{http://codesourcery.com/cxx-abi/,http://codesourcery.com/cxx-abi/} and the
Rust ABI defined at
@@url{https://rust-lang.github.io/rfcs/2603-rust-symbol-name-mangling-v0.html,https://rust-lang.github.io/rfcs/2603-rust-symbol-name-mangling-v0.html}")
    (license license:bsd-3)))

(define-public go-github-com-google-pprof
  (package
    (name "go-github-com-google-pprof")
    (version "0.0.0-20240227163752-401108e1b7e7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/google/pprof")
             (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gnmhivka2lymz7v1gg6wasbj8kj8kvmnzb20g8f74fpf7jbqgac"))))
    (build-system go-build-system)
    (arguments
     (list
      ;; #:go 1.19
      ;; -> (value "Wrong type argument in position 1 (expecting struct): ~S") (value (1.19)) (value (1.19)))
      #:import-path "github.com/google/pprof"))
    (propagated-inputs `(("go-github-com-ianlancetaylor-demangle" ,go-github-com-ianlancetaylor-demangle)
                         ("go-github-com-chzyer-readline" ,go-github-com-chzyer-readline)
                         ("go-github-com-chromedp-chromedp" ,go-github-com-chromedp-chromedp)))
    (home-page "https://github.com/google/pprof")
    (synopsis "Introduction")
    (description
     "pprof is a tool for collection, manipulation and visualization of performance
profiles.")
    (license license:asl2.0)))

(define-public go-github-com-felixge-fgprof
  (package
    (name "go-github-com-felixge-fgprof")
    (version "0.9.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/felixge/fgprof")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "00h4kphvmbcdgad0wmqbaclc4a1pipdb55ay41mwh6cnkdjjvhp0"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/felixge/fgprof"))
    (propagated-inputs `(("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
                         ("go-github-com-google-pprof" ,go-github-com-google-pprof)))
    (home-page "https://github.com/felixge/fgprof")
    (synopsis "🚀 fgprof - The Full Go Profiler")
    (description
     "fgprof is a sampling Go profiler that allows you to analyze On-CPU as well as
[Off-CPU](@@url{http://www.brendangregg.com/offcpuanalysis.html,http://www.brendangregg.com/offcpuanalysis.html})
(e.g. I/O) time together.")
    (license license:expat)))

(define-public go-github-com-pkg-profile
  (package
    (name "go-github-com-pkg-profile")
    (version "1.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pkg/profile")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ifr9gnycjwh7dbvsb5vgs9kzlr548cb4m45zvl8i8lgd3qhppy1"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/pkg/profile"))
    (propagated-inputs `(("go-github-com-felixge-fgprof" ,go-github-com-felixge-fgprof)))
    (home-page "https://github.com/pkg/profile")
    (synopsis "profile")
    (description
     "Package profile provides a simple way to manage runtime/pprof profiling of your
Go application.")
    (license license:bsd-2)))

(define-public go-github-com-jedib0t-go-pretty-v6
  (package
    (name "go-github-com-jedib0t-go-pretty-v6")
    (version "6.5.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jedib0t/go-pretty")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1d8gz2sd2ipbak0phkhqrsw2jx4ga50mv6a0x4q898v7dyb2ffks"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/jedib0t/go-pretty/v6"))
    (propagated-inputs `(("go-golang-org-x-term" ,go-golang-org-x-term)
                         ("go-golang-org-x-sys" ,go-golang-org-x-sys)
                         ("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
                         ("go-github-com-pkg-profile" ,go-github-com-pkg-profile)
                         ("go-github-com-mattn-go-runewidth" ,go-github-com-mattn-go-runewidth)))
    (home-page "https://github.com/jedib0t/go-pretty")
    (synopsis "go-pretty")
    (description
     "Utilities to prettify console output of tables, lists, progress-bars, text, etc.
 with a heavy emphasis on customization.")
    (license license:expat)))

;; guix import go --recursive github.com/muesli/mango

(define-public go-github-com-muesli-roff
  (package
    (name "go-github-com-muesli-roff")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/muesli/roff")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0l263rqwq2ccr1lpamsvs48dddsr70xim8mv6rsj2x9y3prcq3yh"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f ;; FAIL: TestTitleHeading (0.00s)
      #:import-path "github.com/muesli/roff"))
    (home-page "https://github.com/muesli/roff")
    (synopsis "roff")
    (description "roff lets you write roff documents in Go")
    (license license:expat)))

(define-public go-github-com-muesli-mango
  (package
    (name "go-github-com-muesli-mango")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/muesli/mango")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "16d0sga6cbdxzlqkibcgw0civkw11fpkcjpgv21i0q5j9mjbsjw4"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/muesli/mango"))
    (propagated-inputs `(("go-github-com-muesli-roff" ,go-github-com-muesli-roff)))
    (home-page "https://github.com/muesli/mango")
    (synopsis "mango")
    (description
     "mango is a man-page generator for the Go flag, pflag, cobra, coral, and kong
packages.  It extracts commands, flags, and arguments from your program and
enables it to self-document.")
    (license license:expat)))


;; guix import go --recursive github.com/muesli/termenv

(define-public go-github-com-aymanbagabas-go-osc52-v2
  (package
    (name "go-github-com-aymanbagabas-go-osc52-v2")
    (version "2.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/aymanbagabas/go-osc52")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1y4y49zys7fi5wpicpdmjqnk0mb6569zg546km02yck2349jl538"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/aymanbagabas/go-osc52/v2"))
    (home-page "https://github.com/aymanbagabas/go-osc52")
    (synopsis "go-osc52")
    (description
     "OSC52 is a terminal escape sequence that allows copying text to the clipboard.")
    (license license:expat)))

(define-public go-github-com-muesli-termenv
  (package
    (name "go-github-com-muesli-termenv")
    (version "0.15.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/muesli/termenv")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "19yhli6k79aqpra4djp0cl4q76mqxbc1f7in20y0dzhnjb7yz42p"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/muesli/termenv"))
    (propagated-inputs `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
                         ("go-github-com-mattn-go-runewidth" ,go-github-com-mattn-go-runewidth)
                         ("go-github-com-mattn-go-isatty" ,go-github-com-mattn-go-isatty)
                         ("go-github-com-lucasb-eyer-go-colorful" ,go-github-com-lucasb-eyer-go-colorful)
                         ("go-github-com-aymanbagabas-go-osc52-v2" ,go-github-com-aymanbagabas-go-osc52-v2)))
    (home-page "https://github.com/muesli/termenv")
    (synopsis "Features")
    (description
     "@@code{termenv} lets you safely use advanced styling options on the terminal.
It gathers information about the terminal environment in terms of its ANSI &
color support and offers you convenient methods to colorize and style your
output, without you having to deal with all kinds of weird ANSI escape sequences
and color conversions.")
    (license license:expat)))
