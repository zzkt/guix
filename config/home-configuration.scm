;; -*- mode: scheme;  coding: utf-8; -*-
;;
;; tangled from home-configuration.org on 2024-02-07 18:22:13+01:00)

(use-modules (gnu)
             (gnu home)
             (gnu packages)
             (gnu packages gnupg)
             (guix gexp)
             (gnu home services shells)
             (gnu home services gnupg))

(home-environment
 (packages (specifications->packages
            (list
             "nordic-theme"
             "firefox"
             "emacs-guix"
             "emacs-next"
             "rsync"
             "neofetch"
             "nyxt"
             "python"
             "git"
             "gnupg"
             "crda"
             "htop"
             "password-store"
             ;; terminal
             "alacritty"
             ;; mail
             "getmail6"
             "notmuch"
             ;; graphical
             "scribus"
             "inkscape"
             ;; sound
             "supercollider"
             "tidal"
             "ardour"
             "audacity"
             "qpwgraph"
             ;; hardware
             "lm-sensors"
             "dmidecode"
             "lshw"
             "hwinfo"
             "acpi"
             )))

 (services
   (list

    (simple-service 'variant-packages-service
                    home-channels-service-type
                    (list
                     (channel
                      (name 'nonguix)
                      (url "https://gitlab.com/nonguix/nonguix")
                      (branch "master")
                      (commit
                       "fe2fcf125cfc5f7284b24cfac50f37feaf74f7b5")
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
                       "ef1868ed9bdcf1a49771442e405bd88207b3ab0c")
                      (introduction
                       (make-channel-introduction
                        "fc0ada85de1980e1fc9ee50672d827c0c17c3e7d"
                        (openpgp-fingerprint
                         "24A7 4604 91E6 A60F 5BB4  A00F 989F 5E6E DB47 8160"))))))

    (simple-service 'some-useful-env-vars-service
                     home-environment-variables-service-type
                     `(("NOTMUCH_PROFILE" . "$HOME/.config/notmuch/notmuch.conf")
                       ("LD_LIBRARY_PATH" . "$HOME/.guix-profile/lib")
                       ("SHELL" . ,(file-append zsh "/bin/zsh"))))

    (service home-zsh-service-type
                  (home-zsh-configuration
                   ;; configs in $XDG_CONFIG_HOME/zsh
                   (xdg-flavor? #t)
                   (environment-variables
                    '(("HISTFILE" . "$HOME/.config/zsh/.history")
                      ("HISTSIZE" . "800000")
                      ("SAVEHIST" . "800000")))
                   (zshenv
                    (list (local-file ".zshenv" "zshenv")))
                   (zshrc
                    (list (local-file ".zshrc" "zshrc")))))

         (service home-gpg-agent-service-type
                  (home-gpg-agent-configuration
                   (pinentry-program
                    (file-append pinentry-emacs "/bin/pinentry-emacs"))
                   (ssh-support? #t)))

         (service home-dotfiles-service-type
                  (home-dotfiles-configuration
                   (directories (list "dotfiles"))))



        (service home-pipewire-service-type
                 (home-pipewire-configuration
                 (pipewire "pipewire")
                 (wireplumber "wireplumber")
                 (enable-pulseaudio? #t)))

         ;; see -> https://guix.gnu.org/manual/devel/en/html_node/Fonts-Home-Services.html

  ))) ;; end home-environment
