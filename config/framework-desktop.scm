;; -*- mode: scheme;  coding: utf-8; -*-
;;
;; tangled from framework-desktop-system.org on 2026-01-20 23:22:19+01:00)

(use-modules (gnu)
             (gnu packages)
             (guix modules)
             (gnu system nss)
             (gnu system setuid)
             (gnu packages shells)
             (gnu packages linux)
             (gnu packages xdisorg)
             (gnu packages display-managers)
             (gnu packages emacs-xyz))

(use-modules (nongnu packages linux)
             (nongnu system linux-initrd))

(use-service-modules cups
                     sddm
                     desktop
                     networking
                     ssh
                     xorg
                     samba
                     sound
                     mail
                     vpn)

(use-package-modules admin
                     certs
                     package-management
                     ssh
                     tls
                     vpn)

(define-public linux-FWD395
  (corrupt-linux linux-libre-6.17
                 #:name "linux-fwd395"))

(operating-system
 (host-name "glider")
 (locale "en_GB.utf8")
 (timezone "Europe/Belgrade")

;; (hosts-file (local-file "hosts.conf"))

;; (simple-service 'add-extra-hosts
;;                 hosts-service-type
;;                 (list (host "192.0.2.1" "example.com"
;;                             '("example.net" "example.org"))
;;                       (host "2001:db8::1" "example.com"
;;                             '("example.net" "example.org"))))

(keyboard-layout (keyboard-layout
                  "us" "altgr-intl"
                  #:options '("ctrl:nocaps"
                              "altwin:swap_lalt_lwin")))

(kernel linux-6.17)
;; (kernel linux-FWD395)

(kernel-arguments (cons* "splash" "quiet"
                         "threadirqs"
                        %default-kernel-arguments))

(firmware (list linux-firmware
                amdgpu-firmware
                amd-microcode))

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
                                       "render"
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
               (user-group
                (system? #t)
                (name "render"))
               %base-groups))

(sudoers-file
  (plain-file "sudoers"
              "root ALL=(ALL) ALL
%wheel ALL=NOPASSWD: ALL"))

(packages
 (append (map specification->package
              '("emacs"
                "emacs-guix"
                "openssh-sans-x"
                ;; gnome extras
                "gvfs"
                ;; sddm
                "chili-sddm-theme"
                ;; vpn
                "wireguard-tools"
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
          (ipv4-rules (plain-file "iptables.rules"

"*nat
:PREROUTING ACCEPT
:INPUT ACCEPT
:OUTPUT ACCEPT
:POSTROUTING ACCEPT
-A POSTROUTING -o en0 -j MASQUERADE
COMMIT
*filter
:INPUT ACCEPT
:FORWARD ACCEPT
:OUTPUT ACCEPT
-A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 993 -j ACCEPT
-A INPUT -p udp -m udp --dport 5353 -j ACCEPT

-A INPUT -p udp -m udp -s 192.168.0.0/16 --dport 137 -j ACCEPT
-A INPUT -p udp -m udp -s 192.168.0.0/16 --dport 138 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp -s 192.168.0.0/16 --dport 139 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp -s 192.168.0.0/16 --dport 445 -j ACCEPT

-A INPUT -p udp -m udp --dport 51820 -j ACCEPT
-A INPUT -i wg0 -m state --state ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -i wg0 -j ACCEPT

-A INPUT -p tcp -s 192.168.0.0/16 --dport 8384 -j ACCEPT
-A INPUT -p tcp -s 192.168.0.0/16 --dport 21027 -j ACCEPT

-A INPUT -j REJECT --reject-with icmp-port-unreachable
-A INPUT -m conntrack --ctstate INVALID -j DROP
COMMIT
"))

(ipv6-rules (plain-file "ip6tables.rules"
"*nat
:PREROUTING ACCEPT
:INPUT ACCEPT
:OUTPUT ACCEPT
:POSTROUTING ACCEPT
-A POSTROUTING -o en0 -j MASQUERADE
COMMIT
*filter
:INPUT ACCEPT
:FORWARD ACCEPT
:OUTPUT ACCEPT
-A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
-A INPUT -p tcp --dport 22 -j ACCEPT
-A INPUT -p tcp --dport 993 -j ACCEPT
-A INPUT -p udp -m udp --dport 5353 -j ACCEPT

-A INPUT -p udp -m udp -s fded:c2f7:43ef::/64 --dport 137 -j ACCEPT
-A INPUT -p udp -m udp -s fded:c2f7:43ef::/64 --dport 138 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp -s fded:c2f7:43ef::/64 --dport 139 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp -s fded:c2f7:43ef::/64 --dport 445 -j ACCEPT

-A INPUT -p udp -m udp --dport 51820 -j ACCEPT
-A INPUT -i wg0 -m state --state ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -i wg0 -j ACCEPT

-A INPUT -p tcp -s 192.168.0.0/16 --dport 8384 -j ACCEPT
-A INPUT -p tcp -s 192.168.0.0/16 --dport 21027 -j ACCEPT

-A INPUT -j REJECT --reject-with icmp6-port-unreachable
-A INPUT -m conntrack --ctstate INVALID -j DROP
COMMIT
"))))

(service wireguard-service-type
    (wireguard-configuration
      (addresses '("10.0.0.23/32" "fded:dada::23/128"))
      (private-key "/etc/wireguard/private.key")
      (port 51820)
      (peers
       (list
        (wireguard-peer
         (name "lmn")
         (endpoint "example.org:51820")
         (public-key "WHmVhvgxkBxk8fqZU6pWEaH4iVzOcud9JQivwRsaIE8=")
         (allowed-ips '("10.0.0.1/24" "fded:dada::1/64"))
         (keep-alive 25))
        (wireguard-peer
         (name "beryllium")
         (endpoint "example.org:51820")
         (public-key "taeID3fNgci9OpE+1UYkS4DYZE6DIlhpLQL1BVN9sg8=")
         (allowed-ips '("10.0.0.13/32" "fded:dada::13/128"))
         (keep-alive 25))
        (wireguard-peer
         (name "vrt")
         (public-key "4xA6sNrHyAebXZ2i8szdN0WMhH61CE786H+pGQwuLlA=")
         (allowed-ips '("10.0.0.22/32" "fded:dada::22/128"))
         (keep-alive 25))))))

(service sddm-service-type
        (sddm-configuration
         (display-server "x11")
         (remember-last-user? #t)
         (theme "chili")
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

(service plasma-desktop-service-type)
;; (service gnome-desktop-service-type)
;; (service xfce-desktop-service-type)
;; (service lxqt-desktop-service-type)

(service samba-service-type
                    (samba-configuration
                     (enable-smbd? #t)
                     (config-file
                      (plain-file "smb.conf" "\
[global]
protocol = SMB3
logging = syslog@1
workgroup = FOAM
netbios name = drift
security = user
case sensitive = yes
preserve case = yes
short preserve case = yes

[homes]
valid users = %S
browsable = no
writable = yes
"))))

(service pam-limits-service-type
         (list
          (pam-limits-entry "@realtime" 'both 'rtprio 99)
          (pam-limits-entry "@realtime" 'both 'memlock 'unlimited)))

(service bluetooth-service-type)

(service cups-service-type)

;; (simple-service 'fwupd-dbus dbus-root-service-type
;;     (list fwupd-nonfree))

) ;; end services list

(modify-services %desktop-services
                 (delete gdm-service-type))))

;; (name-service-switch %mdns-host-lookup-nss)

(initrd (lambda (file-systems . rest)
          (apply microcode-initrd file-systems
                 #:initrd base-initrd
                 #:microcode-packages (list amd-microcode)
                 rest)))

(bootloader (bootloader-configuration
             (bootloader grub-efi-bootloader)
             (targets (list "/boot/efi"))
             (keyboard-layout keyboard-layout)))

(file-systems (cons* (file-system
                       (mount-point "/boot/efi")
                       (device (uuid "015E-6B5B"
                                     'fat32))
                       (type "vfat"))
                     (file-system
                       (mount-point "/")
                       (device (uuid
                                "a5531379-e048-485b-9b64-77d90eada789"
                                'ext4))
                       (type "ext4")) %base-file-systems))

(swap-devices (list (swap-space
                    (target (uuid
                             "41f59e92-ce1b-46ca-ba4d-ac90eea1c1ae")))))

) ;; end operating-system declaration
