sudo mv /etc/pacman.conf /etc/pacman.conf.old
sudo echo "[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch
" >> /etc/pacman.conf
sudo pacman -S xorg-server xorg-xinit xorg-server-utils xf86-input-synaptics nvidia acpid
sudo systemctl enable acpid
sudo nvidia-xconfig
sudo echo "install i915 /bin/false
install intel_agp /bin/false
install intel_gtt /bin/false" > /etc/modprobe.d/video.conf
sudo rm -rf /etc/X11/xorg.conf /etc/X11/xorg.conf.d
sudo cp ~/.etc/X11/xorg.conf /etc/X11/xorg.conf
sudo cp -r ~/.etc/X11/xorg.conf.d /etc/X11/xorg.conf.d
yaourt -S xmonad xmonad-contrib cabal-install slim terminator xmobar dmenu-xft trayer scrot xscreensaver feh parcellite pidgin network-manager-applet xfce4-notifyd gnome-keyring git nautilus ranger fcitx-im
cabal update && cabal install yeganesh
sudo systemctl enable NetworkManager
sudo systemctl enable slim
sudo pacman -S gtk-engine-murrine oxygen-icons oxygen-icons-svg xcursor-vanilla-dmz