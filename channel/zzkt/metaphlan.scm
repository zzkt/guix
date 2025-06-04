;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2014-2025 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2015, 2016, 2017, 2018 Ben Woodcroft <donttrustben@gmail.com>
;;; Copyright © 2015, 2016, 2018, 2019, 2020 Pjotr Prins <pjotr.guix@thebird.nl>
;;; Copyright © 2015 Andreas Enge <andreas@enge.fr>
;;; Copyright © 2016, 2020, 2021 Roel Janssen <roel@gnu.org>
;;; Copyright © 2016-2024 Efraim Flashner <efraim@flashner.co.il>
;;; Copyright © 2016, 2020, 2022 Marius Bakke <marius@gnu.org>
;;; Copyright © 2016, 2018 Raoul Bonnal <ilpuccio.febo@gmail.com>
;;; Copyright © 2017, 2018 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2017, 2021, 2022, 2024, 2025 Arun Isaac <arunisaac@systemreboot.net>
;;; Copyright © 2018 Joshua Sierles, Nextjournal <joshua@nextjournal.com>
;;; Copyright © 2018 Gábor Boskovits <boskovits@gmail.com>
;;; Copyright © 2018-2024 Mădălin Ionel Patrașcu <madalinionel.patrascu@mdc-berlin.de>
;;; Copyright © 2019, 2020, 2021, 2023 Maxim Cournoyer <maxim.cournoyer@gmail.com>
;;; Copyright © 2019 Brian Leung <bkleung89@gmail.com>
;;; Copyright © 2019 Brett Gilio <brettg@gnu.org>
;;; Copyright © 2020 Björn Höfling <bjoern.hoefling@bjoernhoefling.de>
;;; Copyright © 2020 Jakub Kądziołka <kuba@kadziolka.net>
;;; Copyright © 2020 Pierre Langlois <pierre.langlois@gmx.com>
;;; Copyright © 2020 Bonface Munyoki Kilyungi <bonfacemunyoki@gmail.com>
;;; Copyright © 2021 Tim Howes <timhowes@lavabit.com>
;;; Copyright © 2021 Hong Li <hli@mdc-berlin.de>
;;; Copyright © 2021, 2022, 2023 Simon Tournier <zimon.toutoune@gmail.com>
;;; Copyright © 2021 Felix Gruber <felgru@posteo.net>
;;; Copyright © 2022-2025 Navid Afkhami <navid.afkhami@mdc-berlin.de>
;;; Copyright © 2022 Antero Mejr <antero@mailbox.org>
;;; Copyright © 2024 Alexis Simon <alexis.simon@runbox.com>
;;; Copyright © 2024 Spencer King <spencer.king@geneoscopy.com>
;;; Copyright © 2025 nomike Postmann <nomike@nomike.com>
;;;
;;; This file is part of GNU Guix.
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

(define-module (gnu packages bioinformatics)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix hg-download)
  #:use-module (guix build-system ant)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system go)
  #:use-module (guix build-system haskell)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system qt)
  #:use-module (guix build-system r)
  #:use-module (guix build-system ruby)
  #:use-module (guix build-system trivial)
  #:use-module (guix deprecation)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages assembly)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages bioconductor)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages check)
  #:use-module (gnu packages code)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages cpio)
  #:use-module (gnu packages cran)
  #:use-module (gnu packages crates-compression)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-web)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages docbook)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages datastructures)
  #:use-module (gnu packages dlang)
  #:use-module (gnu packages file)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gd)
  #:use-module (gnu packages golang-build)
  #:use-module (gnu packages golang-check)
  #:use-module (gnu packages golang-compression)
  #:use-module (gnu packages golang-xyz)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages graph)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages groff)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages guile-xyz)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-web)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages image)
  #:use-module (gnu packages image-processing)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages java)
  #:use-module (gnu packages java-compression)
  #:use-module (gnu packages java-xml)
  #:use-module (gnu packages jemalloc)
  #:use-module (gnu packages jupyter)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages logging)
  #:use-module (gnu packages lsof)
  #:use-module (gnu packages machine-learning)
  #:use-module (gnu packages man)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages mpi)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages node)
  #:use-module (gnu packages ocaml)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages parallel)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages perl-check)
  #:use-module (gnu packages perl-web)
  #:use-module (gnu packages perl6)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages popt)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages python-compression)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages rdf)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages rpc)
  #:use-module (gnu packages rsync)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages skribilo)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages statistics)
  #:use-module (gnu packages swig)
  #:use-module (gnu packages tbb)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages time)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages uglifyjs)
  #:use-module (gnu packages video)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wget)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (guix platform)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26)
  #:use-module (ice-9 match))

;; based on /gnu/packages/bioinformatics.scm

(define-public metaphlan
  (package
    (name "metaphlan")
    (version "4.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "MetaPhlAn" version))
       (sha256
        (base32 "0n733jqb7nqmaivngkbzyyih61h1i5kgh4nm6pfzwqncpdkm886f"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-biom-format
                             python-biopython
                             python-dendropy
                             python-h5py
                             python-numpy
                             python-pandas
                             python-phylophlan
                             python-pysam
                             python-requests
                             python-scipy))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "http://github.com/biobakery/MetaPhlAn/")
    (synopsis
     "MetaPhlAn is a computational tool for profiling the composition of microbial communities (Bacteria, Archaea and Eukaryotes) from metagenomic shotgun sequencing data (i.e. not 16S) with species-level. With the newly added StrainPhlAn module, it is now possible to perform accurate strain-level microbial profiling.")
    (description
     "@code{MetaPhlAn} is a computational tool for profiling the composition of
microbial communities (Bacteria, Archaea and Eukaryotes) from metagenomic
shotgun sequencing data (i.e.  not 16S) with species-level.  With the newly
added @code{StrainPhlAn} module, it is now possible to perform accurate
strain-level microbial profiling.")
    (license #f)))
