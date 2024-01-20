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

(define-module (zzkt packages gephi)
  #:use-module (guix)
  #:use-module (guix build-system ant)
  #:use-module (guix build-system copy)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages gawk))

(define-public gephi-ant-nest
  (package
    (name "gephi")
    (version "0.10.2")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/gephi/gephi/")
            (commit "0.10.2")))
      (file-name (git-file-name name version))
      (sha256 (base32 "01ywl2p5yi6ccam8778yjayrjjvmbh2h3yw4qd263siyih0zs9hj"))))
    (inputs
     (list gawk))
    (build-system ant-build-system)
    ;; (arguments (list #:configure-flags #~(list "--enable-silent-rules")))
    (home-page "https://gephi.org/")
    (synopsis "The Open Graph Viz Platform. Built from source")
    (description
     "Gephi is a tool for data analysts and scientists keen to explore and understand graphs. Like Photoshop™ but for graph data, the user interacts with the representation, manipulate the structures, shapes and colors to reveal hidden patterns. The goal is to help data analysts to make hypothesis, intuitively discover patterns, isolate structure singularities or faults during data sourcing. It is a complementary tool to traditional statistics, as visual thinking with interactive interfaces is now recognized to facilitate reasoning. This is a software for Exploratory Data Analysis, a paradigm appeared in the Visual Analytics field of research.")
    (license license:gpl3+)))


;; https://github.com/gephi/gephi/releases/download/v0.10.1/gephi-0.10.1-linux-x64.tar.gz

(define-public gephi-binary
  (package
    (name "gephi-binary")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/gephi/gephi/releases/download/v0.10.1/gephi-0.10.1-linux-x64.tar.gz")
       (sha256
        (base32 "0y7kzwh5ascmqs7whlf5jajj46zy2zyb57944sggy1rz7i6czhpn"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
       #~'(("bin" "bin")
           ("etc" "etc")
           ("extra" "extra")
           ("flathub" "flathub")
           ("gephi" "gephi")
           ("jre-x64" "jre-x64")
           ("platform" "platform"))))
    (home-page "https://gephi.org/")
    (synopsis "The Open Graph Viz Platform. Latest binary release")
    (description
     "Gephi is a tool for data analysts and scientists keen to explore and understand graphs. Like Photoshop™ but for graph data, the user interacts with the representation, manipulate the structures, shapes and colors to reveal hidden patterns. The goal is to help data analysts to make hypothesis, intuitively discover patterns, isolate structure singularities or faults during data sourcing. It is a complementary tool to traditional statistics, as visual thinking with interactive interfaces is now recognized to facilitate reasoning. This is a software for Exploratory Data Analysis, a paradigm appeared in the Visual Analytics field of research.")
    (license license:gpl3+)))
