+;;; GNU Guix --- Functional package management for GNU
;;; Copyright 2022 Petr Hodina <phodina@protonmail.com>
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

;; via https://issues.guix.gnu.org/60699

;; (define-module (gnu services firmware)
;;   #:use-module (guix diagnostics)
;;   #:use-module (guix gexp)
;;   #:use-module (guix records)
;;   #:use-module (guix modules)
;;   #:use-module (guix i18n)
;;   #:use-module (guix ui)
;;   #:use-module (gnu services)
;;   #:use-module (gnu services base)
;;   #:use-module (gnu services shepherd)
;;   #:use-module (gnu packages firmware)
;;   #:use-module (srfi srfi-1)
;;   #:use-module (srfi srfi-26)
;;   #:use-module (srfi srfi-34)
;;   #:use-module (srfi srfi-35)
;;   #:use-module (ice-9 match)
;;   #:export (fwupd-configuration fwupd-service-type))

;; ;;; Fwupd daemon.

;; (define-record-type* <fwupd-configuration> fwupd-configuration
;;   make-fwupd-configuration fwupd-configuration?
;;   (fwupd fwupd-configuration-fwupd
;;          (default fwupd)))

;; (define fwupd-activation-service
;;   #~(begin
;;       (use-modules (guix build utils))
;;       (mkdir-p "/var/lib/fwupd")))

;; (define (fwupd-shepherd-service config)
;;   (shepherd-service (documentation "Run the fwupd daemon.")
;;                     (provision '(fwupd))
;;                     (requirement '(dbus-system udev))
;;                     (start #~(make-forkexec-constructor
;;                               (list (string-append #$fwupd "/libexec/fwupd/fwupd"))))
;;                     (stop #~(make-kill-destructor))))

;; (define fwupd-service-type
;;   (service-type (name 'fwupd)
;;                 (default-value (fwupd-configuration))
;;                 (extensions
;;                  (list (service-extension activation-service-type
;;                                           (const
;;                                            fwupd-activation-service))
;;                        (service-extension
;;                         shepherd-root-service-type
;;                         (compose list fwupd-shepherd-service))))
;;                 (description
;;                  "Run @command{fwupd}, the Firmware update daemon.")))
