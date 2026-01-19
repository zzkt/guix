;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2025 nik gaffney <nik@fo.am>
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

;; based on /gnu/packages/bioinformatics.scm

(define-module (zzkt packages bioinformatics)
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
                              '("METAPHLAN_DB_DIR" = ("/var/lib/metaphlan/metaphlan_databases/"))))))))
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
    (name "metaphlan-data")
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
     (home-page "http://github.com/biobakery/MetaPhlAn/")
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

;; graahlan
;;  install via https://github.com/biobakery/graphlan

(define-public graphlan
  (package
    (name "graphlan")
    (version "1.1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "graphlan" version))
       (sha256
        (base32 "02pdnhkyp3w588n2sp17dc2x8rwqn1bf2m9qwvbysfd12dzxh3ml"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-biopython
                             python-matplotlib
                             python-scipy))
    (native-inputs (list python-setuptools
                         python-wheel))
    (arguments
     (list
      #:tests? #f
      #:phases
          #~(modify-phases %standard-phases
                           ;; fix check for biopython==1.76
                           (delete 'sanity-check))))
    (home-page "http://github.com/biobakery/graphlan")
    (synopsis
     "Circular representations of taxonomic and phylogenetic trees.")
    (description
     "@code{GraPhlAn} is a software tool for producing high-quality circular
representations of taxonomic and phylogenetic trees. @code{GraPhlAn} focuses on
concise, integrative, informative, and publication-ready representations of
phylogenetically- and taxonomically-driven investigation.")
   (license license:expat)))

;; https://github.com/biobakery/humann

(define-public humann
  (package
    (name "humann")
    (version "3.9")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "humann" version))
       (sha256
        (base32 "11r27f2rz19phbffr31c7lhvldqpbypb8806108kwpjzwjxxs66h"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    ;; other requirements
    ;; - MinPath
    ;; - Xipe
    ;; - SAMtools (only required if bam input files are provided)
    ;; - Biom-format (only required if input or output files are in biom format)
    (propagated-inputs (list bowtie
                             diamond
                             python-biopython
                             python-matplotlib
                             python-scipy))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
                       ;; sanity check fails since databases are not downloaded (yet)
                       ;; can be tested post-install using 'humann_test'
                       (delete 'sanity-check))))
    (home-page "https://github.com/biobakery/humann")
    (synopsis "HUMAnN: The HMP Unified Metabolic Analysis Network")
    (description
     "HUMAnN is a method for efficiently and accurately profiling the abundance of microbial metabolic pathways and other molecular functions from metagenomic or metatranscriptomic sequencing data.")
    (license license:expat)))

;; guix download --git https://github.com/zzkt/humann --commit=dac9a42997d8b1030f8b871f5ab0bdd5cd6834b4

(define-public humann-next
  (package
    (name "humann-next")
    (version "4.0.0a1-zzkt")
    (source
      (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/zzkt/humann")
             (commit "dac9a42997d8b1030f8b871f5ab0bdd5cd6834b4")))
       ;; (file-name (git-file-name name version))
       (sha256
        (base32 "1hfszsychcbh5j8x32ks7x7bllynbmvycvv4za985bdplamlpc7c"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    ;; other requirements
    ;; - MinPath
    ;; - Xipe
    ;; - SAMtools (only required if bam input files are provided)
    ;; - Biom-format (only required if input or output files are in biom format)
    (propagated-inputs (list bowtie
                             diamond
                             python-biopython
                             python-matplotlib
                             python-scipy))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
                       ;; sanity check fails since databases are not downloaded (yet)
                       ;; can be tested post-install using 'humann_test'
                       (delete 'sanity-check))))
    (home-page "https://github.com/biobakery/humann")
    (synopsis "HUMAnN: The HMP Unified Metabolic Analysis Network")
    (description
     "HUMAnN is a method for efficiently and accurately profiling the abundance of microbial metabolic pathways and other molecular functions from metagenomic or metatranscriptomic sequencing data.")
    (license license:expat)))

;; humann_data
;; - humann_databases --download chocophlan full /var/lib/humann
;; - humann_databases --download uniref uniref90_diamond /var/lib/humann

;; https://github.com/fbreitwieser/pavian
