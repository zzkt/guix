;; -*- mode: scheme;  coding: utf-8; -*-
;;
;; tangled from framework13-system.org on 2024-01-17 16:18:35+01:00)

(use-modules (gnu)
             (gnu packages)
             (guix modules)
             (gnu system nss)
             (gnu system setuid)
             (gnu packages shells)
             (gnu packages linux)
             (gnu packages xdisorg)
             (gnu packages emacs-xyz))

(use-modules (nongnu packages linux)
             (nongnu system linux-initrd))

(use-service-modules cups
                     desktop
                     networking
                     ssh
                     xorg
                     samba
                     sound
                     mail)

(use-package-modules admin
                     certs
                     package-management
                     ssh
                     tls)

(define-public linux-fw13
  (corrupt-linux linux-libre-6.6
                 #:name "linux-fw13"
                 #:configs '("CONFIG_MT7921E=m")))

(operating-system
 (host-name "zxxcxxz")
 (locale "en_GB.utf8")
 (timezone "Europe/Amsterdam")

 (keyboard-layout (keyboard-layout
                   "us" "altgr-intl"
                   #:options '("ctrl:nocaps"
                               "altwin:swap_lalt_lwin")))

 (kernel linux-fw13)
 (kernel-arguments '("modprobe.blacklist=hid_sensor_hub"))

 (firmware (list linux-firmware))
 ;; (firmware (list amdgpu-firmware
 ;;                 amd-microcode
 ;;                 realtek-firmware))

 (users (cons* (user-account
                (name "zzk")
                (comment "zzk")
                (group "users")
                (home-directory "/home/zzk")
                (shell (file-append zsh "/bin/zsh"))
                (supplementary-groups '("wheel"
                                        "netdev"
                                        "audio"
                                        "video"
                                        "www-data"
                                         "realtime"
                                        "lp")))
               (user-account
                (name "www-data")
                (group "www-data")
                (home-directory "/home/www"))
               %base-user-accounts))

 (groups (cons* (user-group
                 (name "www-data"))
                (user-group
                 (system? #t)
                 (name "realtime"))
                %base-groups))

 (sudoers-file
  (plain-file "sudoers"
              "root ALL=(ALL) ALL
%wheel ALL=NOPASSWD: ALL"))

 (packages
  (append (map specification->package
               '("emacs"
                 "emacs-guix"
                 "emacs-exwm"
                 "openssh-sans-x"
                 "nss-certs"
                 "htop"
                 ;; xfce
                 "xfce4-power-manager"
                 "xfce4-screensaver"
                 "xfce4-settings"
                 "xfce4-session"
                 "xfce4-panel"
                 ;; gnome extras
                 "gnome-tweaks"
                 "gvfs"
                 ))
          %base-packages))

 (services
  (append (list

           (service openssh-service-type
                    (openssh-configuration
                     (openssh openssh-sans-x)
                     (password-authentication? #true)
                     (authorized-keys
                      `(("zzk" ,(local-file "zzk_rsa.pub"))
                        ("root" ,(local-file "zzk_rsa.pub"))))))

           (service dovecot-service-type
                    (dovecot-configuration
                     (mail-location "maildir:%h/Maildir:LAYOUT=fs")))

           (service iptables-service-type
                    (iptables-configuration
                     (ipv4-rules (plain-file "iptables.rules" "*filter
:INPUT ACCEPT
:FORWARD ACCEPT
:OUTPUT ACCEPT
-A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 993 -j ACCEPT
-A INPUT -p udp -m udp -s 192.168.0.0/16 --dport 137 -j ACCEPT
-A INPUT -p udp -m udp -s 192.168.0.0/16 --dport 138 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp -s 192.168.0.0/16 --dport 139 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp -s 192.168.0.0/16 --dport 445 -j ACCEPT
-A INPUT -j REJECT --reject-with icmp-port-unreachable
-A INPUT -m conntrack --ctstate INVALID -j DROP
COMMIT
"))
                     (ipv6-rules (plain-file "ip6tables.rules" "*filter
:INPUT ACCEPT
:FORWARD ACCEPT
:OUTPUT ACCEPT
-A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
-A INPUT -p tcp --dport 22 -j ACCEPT
-A INPUT -p tcp --dport 993 -j ACCEPT
-A INPUT -p udp -m udp -s 192.168.0.0/16 --dport 137 -j ACCEPT
-A INPUT -p udp -m udp -s 192.168.0.0/16 --dport 138 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp -s 192.168.0.0/16 --dport 139 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp -s 192.168.0.0/16 --dport 445 -j ACCEPT
-A INPUT -j REJECT --reject-with icmp6-port-unreachable
-A INPUT -m conntrack --ctstate INVALID -j DROP
COMMIT
"))))

           ;; (service sddm-service-type
           ;; 	    (sddm-configuration
           ;; 	     (display-server "wayland")
           ;; 	     (remember-last-user? #t)))

           (service gdm-service-type
                    (gdm-configuration
                     (auto-suspend? #f)
                     (xorg-configuration
                      (xorg-configuration
                       (keyboard-layout keyboard-layout)

                       (extra-config '("Section \"InputClass\"
                                            Identifier \"touchpad\"
                                            Driver \"libinput\"
                                            MatchIsTouchpad \"on\"
                                            Option \"Tapping\" \"on\"
                                            Option \"TappingButtonMap\" \"lrm\"
                                            Option \"ClickMethod\" \"clickfinger\"
                                            Option \"AccelProfile\" \"adaptive\"
                                        EndSection"))))))

           (service gnome-desktop-service-type)
           (service xfce-desktop-service-type)

           (service samba-service-type
                    (samba-configuration
                     (enable-smbd? #t)
                     (config-file
                      (plain-file "smb.conf" "\
[global]
protocol = SMB3
logging = syslog@1
workgroup = FOAM
netbios name = zxXCXxz
security = user
case sensitive = yes
preserve case = yes
short preserve case = yes

[homes]
valid users = %S
browsable = no
writable = yes
"))))

           (service bluetooth-service-type)

           (service cups-service-type)

        ) ;; end services list

          (modify-services %desktop-services
                           (delete gdm-service-type))))

 (name-service-switch %mdns-host-lookup-nss)

 (setuid-programs
  (cons*
   (setuid-program
    (program (file-append xsecurelock "/libexec/xsecurelock/authproto_pam")))
          %setuid-programs))

 (initrd (lambda (file-systems . rest)
           (apply microcode-initrd file-systems
                  #:initrd base-initrd
                  #:microcode-packages (list amd-microcode)
                  rest)))

 (bootloader (bootloader-configuration
              (bootloader grub-efi-bootloader)
              (targets (list "/boot/efi"))
              (keyboard-layout keyboard-layout)))

 (swap-devices (list (swap-space
                      (target (uuid
                               "2ce27ab3-07f7-4c24-90bd-9fbe14c0850d")))))

 (file-systems (cons* (file-system
                       (mount-point "/boot/efi")
                       (device (uuid "8B3C-3BC0" 'fat32))
                       (type "vfat"))
                      (file-system
                       (mount-point "/")
                       (device (uuid
                                "e0ece027-0396-4546-8aba-2ce91285d061"
                                'ext4))
                       (type "ext4"))
                      %base-file-systems))

 ) ;; end operating-system declaration
