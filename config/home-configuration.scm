;; -*- mode: scheme;  coding: utf-8; -*-
;;
;; tangled from home-configuration.org on 2024-03-19 23:04:17+01:00)

(use-modules (gnu)
             (gnu home)
             (gnu services)
             (gnu packages)
             (gnu packages gnupg)
             (gnu packages shells)
             (gnu home services)
             (gnu home services guix)
             (gnu home services shells)
             (gnu home services dotfiles)
             (gnu home services desktop)
             (gnu home services sound)
             (gnu home services gnupg)
             (guix channels)
             (guix gexp))

(home-environment
 (packages (specifications->packages
            (list

             "emacs-guix"
             "emacs-next"
             "libreoffice"
             "rsync"
             "gnupg"
             "rbw"
             "crda"
             "htop"
             "tree"
             "password-store"

             "dolphin-plugins"
             "akonadi"

             "kitty"

             "icedove" ;; aka thunderbird
             "getmail6"
             "notmuch"

             "scribus"
             "inkscape"
             "gimp"
             "imagemagick"

             "supercollider"
             "tidal"
             "ardour"
             "audacity"
             "qpwgraph"
             "patchage"

             "guile"
             "sbcl"
             "racket"
             "python"
             "gcc-toolchain"
             "git" "git:send-email"

             "firefox"
             ;; "nyxt"
             "nextcloud-client"
             "nmap"
             "w3m"

             "font-monaspace"
             "font-recursive"
             "font-fira-sans"
             "font-fira-mono"
             "font-victor-mono"

             "lm-sensors"
             "dmidecode"
             "lshw"
             "hwinfo"
             "acpi"
             ))) ;; end packages

 (services
   (list

    (simple-service 'variant-packages-service
                    home-channels-service-type
                    (list
                     (channel
                      (name 'nonguix)
                      (url "https://gitlab.com/nonguix/nonguix")
                      (branch "master")
                      (introduction
                       (make-channel-introduction
                        "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
                        (openpgp-fingerprint
                         "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
                     (channel
                      (name 'zzkt)
                      (url "https://gitlab.com/zzkt/guix")
                      (branch "endless")
                      (commit
                       "02cdb798288a79e77e2b42f712c64b758de22499")
                      (introduction
                       (make-channel-introduction
                        "fc0ada85de1980e1fc9ee50672d827c0c17c3e7d"
                        (openpgp-fingerprint
                         "24A7 4604 91E6 A60F 5BB4  A00F 989F 5E6E DB47 8160"))))))

    (simple-service 'variant-env-vars-service
                     home-environment-variables-service-type
                     `(("GUIX_LOCPATH" . "$HOME/.guix-profile/lib/locale")
                       ("NOTMUCH_CONFIG" . "$XDG_CONFIG_HOME/notmuch/notmuch.conf")
                       ("LD_LIBRARY_PATH" . "$HOME/.guix-profile/lib")
                       ("GPG_TTY" . "$TTY")
                       ("SHELL" . ,(file-append zsh "/bin/zsh"))))

   (service home-zsh-service-type
            (home-zsh-configuration
             ;; configs in $XDG_CONFIG_HOME/zsh
             (xdg-flavor? #t)
             (environment-variables
              '(("HISTFILE" . "$XDG_CONFIG_HOME/zsh/.history")
                ("HISTSIZE" . "800000")
                ("SAVEHIST" . "800000")))))

             ;; (zshenv
             ;;  (list (local-file ".zshenv" "zshenv")))
             ;; (zshrc
             ;;  (list (local-file ".zshrc" "zshrc")))))

   (service home-gpg-agent-service-type
            (home-gpg-agent-configuration
             (pinentry-program
              (file-append pinentry-qt "/bin/pinentry-qt"))
             (ssh-support? #t)))

         (service home-dotfiles-service-type
                  (home-dotfiles-configuration
                   (layout 'plain)
                   (directories (list "dotfiles"))
                   (excluded
                    '(".*~" ".*\\.swp" "\\.git" "\\.gitignore" ".zshenv"))))

  ;; ssh config in 'dotfiles'

   (service home-dbus-service-type)

   (service home-pipewire-service-type
            (home-pipewire-configuration
             (enable-pulseaudio? #t)))

  )) ;; end services

  ) ;; end home-environment
