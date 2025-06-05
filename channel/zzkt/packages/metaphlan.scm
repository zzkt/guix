;;; GNU Guix --- Functional package management for GNU

;; based on /gnu/packages/bioinformatics.scm

(define-module (zzkt packages metaphlan)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (gnu packages)
  #:use-module (gnu packages bioinformatics)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages python-compression)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26)
  #:use-module (ice-9 match))

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
    ;; set database directory to a writable location
    (wrap-program (string-append out "/bin/metaphlan")
                  '("METAPHLAN_DB_DIR" prefix "$HOME/metaphlan_databases/"))
    (synopsis
     "Profiling of microbial communities from Metagenomic Shotgun Sequencing data.")
    (description
     "@code{MetaPhlAn} is a computational tool for profiling the composition of microbial communities (Bacteria, Archaea and Eukaryotes) from metagenomic shotgun sequencing data (i.e. not 16S) with species-level. With the @code{StrainPhlAn} module, it is possible to perform accurate strain-level microbial profiling.")
    (license license:expat)))
