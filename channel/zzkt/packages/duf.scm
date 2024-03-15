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
  #:use-module (gnu packages gawk))

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
     (list go))
    (build-system go-build-system)
    (arguments (list #:configure-flags #~(list "--enable-silent-rules")))
    (home-page "https://www.gnu.org/software/hello/")
    (synopsis "Disk Usage/Free Utility. A better 'df' alternative")
    (description "Disk Usage/Free Utility. Features include; User-friendly, colorful output; Adjusts to your terminal's theme & width; Sort the results according to your needs; Groups & filters devices; Can conveniently output JSON.")
    (license license:expat)))
