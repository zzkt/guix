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
  #:use-module (guix build-system copy)
  #:use-module (guix build utils)
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
    (version "4.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "MetaPhlAn" version))
       (sha256
        (base32 "0w22bf2zxbdq1sjxly2d5zp11djcwza94zv62rlyjpqrrjfv42r2"))))
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
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
           (add-after 'check 'wrap-program
              (lambda* _
                ;; set database directory to a writable location
                (wrap-program (string-append #$output "/bin/metaphlan")
                              '("METAPHLAN_DB_DIR" = "/var/lib/metaphlan/metaphlan_databases/")))))))
    ;; search paths for shared databases
     (search-paths
      (list (search-path-specification
          (variable "METAPHLAN_DB_DIR")
          (separator #f)
          (files (list "/var/lib/metaphlan/metaphlan_databases/")))))
    (synopsis
     "Profiling of microbial communities from Metagenomic Shotgun Sequencing data.")
    (description
     "@code{MetaPhlAn} is a computational tool for profiling the composition of microbial communities (Bacteria, Archaea and Eukaryotes) from metagenomic shotgun sequencing data (i.e. not 16S) with species-level. With the @code{StrainPhlAn} module, it is possible to perform accurate strain-level microbial profiling.")
    (license license:expat)))


;; metaphlan databases
;; via http://cmprod1.cibio.unitn.it/biobakery4/metaphlan_databases/
;; - mpa_vJan25_CHOCOPhlAnSGB_202503.nwk
;; - mpa_vJan25_CHOCOPhlAnSGB_202503.tar
;; - mpa_vJan25_CHOCOPhlAnSGB_202503_marker_info.txt.bz2
;; - mpa_vJan25_CHOCOPhlAnSGB_202503_species.txt.bz2

(define-public metaphlan_data
  (package
    (name "metaphlan_data")
    (version "mpa_vJan25_CHOCOPhlAnSGB_202503")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://cmprod1.cibio.unitn.it/biobakery4/metaphlan_databases/"
             version ".tar"))
       (sha256
        (base32 "17s8993b6v5nvv5mcfasfi79d4hnj9bkim4xrlh3j2nvaanimbdr"))))
        (build-system copy-build-system)
        (arguments
         (list
          #:install-plan
          #~'(("mpa_vJan25_CHOCOPhlAnSGB_202503.pkl" "mpa_vJan25_CHOCOPhlAnSGB_202503.pkl")
              ("mpa_vJan25_CHOCOPhlAnSGB_202503_VINFO.csv" "mpa_vJan25_CHOCOPhlAnSGB_202503_VINFO.csv")
              ("mpa_vJan25_CHOCOPhlAnSGB_202503_VSG.fna.bz2" "mpa_vJan25_CHOCOPhlAnSGB_202503_VSG.fna.bz2")
              ("mpa_vJan25_CHOCOPhlAnSGB_202503_SGB.fna.bz2" "mpa_vJan25_CHOCOPhlAnSGB_202503_SGB.fna.bz2"))
          #:phases
          #~(modify-phases %standard-phases
              (add-after 'install 'symlinks
                         (lambda* _
                           (symlink
                            (string-append #$output "mpa_vJan25_CHOCOPhlAnSGB_202503.pkl")
                            "/var/lib/metaphlan/metaphlan_databases/."))))))
    ;; search paths for shared databases
     (search-paths
      (list (search-path-specification
          (variable "METAPHLAN_DB_DIR")
          (separator #f)
          (files (list "/var/lib/metaphlan/metaphlan_databases/")))))
    (synopsis
     "Database mpa_vJan25_CHOCOPhlAnSGB_202503 for MetaPhlAn.")
    (description
     "@code{MetaPhlAn} relies on ~5.1M unique clade-specific marker genes (the latest marker information file can be found here) identified from ~1M microbial genomes (~236,600 references and 771,500 metagenomic assembled genomes) spanning 26,970 species-level genome bins (SGBs), 4,992 of them taxonomically unidentified at the species level, allowing:

- unambiguous taxonomic assignments;
- an accurate estimation of organismal relative abundance;
- SGB-level resolution for bacteria, archaea and eukaryotes;
- strain identification and tracking
- orders of magnitude speedups compared to existing methods.
- metagenomic strain-level population genomics")
    (license license:expat)))
