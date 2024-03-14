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
  #:use-module (guix build-system node)
  #:use-module (guix git-download)
  #:use-module ((guix licenses)
                #:prefix license:))

;; binary
;; https://releases.mattermost.com/desktop/5.6.0/mattermost-desktop-5.6.0-linux-x64.tar.gz

;; source
;; https://github.com/mattermost/desktop

;; - create_desktop_file.sh
;; - mattermost-desktop

(define-public mattermost-desktop-binary
  (package
    (name "mattermost-desktop-binary")
    (version "5.6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://releases.mattermost.com/desktop/5.6.0/mattermost-desktop-5.6.0-linux-x64.tar.gz")
       (sha256
        (base32 "1x0pigcl1a6clrv8zki4m9qnjc15fzz0c0h2y19f8pvwgp67yh99"))))
    (build-system copy-build-system)
    (arguments
     ;; via readme.md
     ;; /opt/mattermost-desktop/create_desktop_file.sh

     ;; #!/bin/sh
     ;; set -e
     ;; WORKING_DIR=`pwd`
     ;; THIS_PATH=`readlink -f $0`
     ;; cd `dirname ${THIS_PATH}`
     ;; FULL_PATH=`pwd`
     ;; cd ${WORKING_DIR}
     ;; cat <<EOS > Mattermost.desktop
     ;; [Desktop Entry]
     ;; Name=Mattermost
     ;; Comment=Mattermost Desktop application for Linux
     ;; Exec="${FULL_PATH}/mattermost-desktop" %U
     ;; Terminal=false
     ;; Type=Application
     ;; Icon=${FULL_PATH}/app_icon.png
     ;; Categories=Network;InstantMessaging;
     ;; EOS
     ;; chmod +x Mattermost.desktop

     ;; mv Mattermost.desktop ~/.local/share/applications/
     ;; sudo ln -s /opt/mattermost-desktop/mattermost-desktop /usr/local/bin/

     (list #:install-plan
       #~'(("mattermost-desktop" "bin/mattermost-desktop")
           ("resources" "resources"))))

    (home-page "https://mattermost.com/")
    (synopsis "Collaboration platform for technical and operational teams. (binary release)")
    (description
     "Work together effectively with real-time communication, file and code snippet sharing, in-line code syntax highlighting, and workflow automation purpose-built for technical teams.")
    (license license:asl2.0)))


;; source
;; https://github.com/mattermost/desktop

(define-public mattermost-desktop
  (package
    (name "mattermost-desktop")
    (version "5.6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://releases.mattermost.com/desktop/5.6.0/mattermost-desktop-5.6.0-linux-x64.tar.gz")
       (sha256
        (base32 "1x0pigcl1a6clrv8zki4m9qnjc15fzz0c0h2y19f8pvwgp67yh99"))))
    (build-system copy-build-system)
    (home-page "https://mattermost.com/")
    (synopsis "Collaboration platform for technical and operational teams. (binary release)")
    (description
     "Work together effectively with real-time communication, file and code snippet sharing, in-line code syntax highlighting, and workflow automation purpose-built for technical teams.")
    (license license:asl2.0)))
