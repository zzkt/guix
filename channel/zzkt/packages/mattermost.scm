;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2024 nik gaffney <nik@fo.am>
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

(define-module (zzkt packages mattermost)
  #:use-module (guix)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses)
                #:prefix license:))

;; https://releases.mattermost.com/desktop/5.6.0/mattermost-desktop-5.6.0-linux-x64.tar.gz

;; https://github.com/mattermost/desktop

(define-public mattermost-client
  (package
    (name "gephi-binary")
    (version "5.6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://releases.mattermost.com/desktop/5.6.0/mattermost-desktop-5.6.0-linux-x64.tar.gz")
       (sha256
        (base32 ""))))
    (build-system copy-build-system)
    (home-page "https://mattermost.com/")
    (synopsis "Collaboration platform for technical and operational teams. (binary release)")
    (description
     "Work together effectively with real-time communication, file and code snippet sharing, in-line code syntax highlighting, and workflow automation purpose-built for technical teams.")
    (license license:asl2.0)))
