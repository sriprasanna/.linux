sudo pacman -S xorg-server xorg-xinit xorg-server-utils xf86-input-synaptics nvidia acpid
sudo systemctl enable acpid
sudo nvidia-xconfig
sudo cp ~/.etc/X11/xorg.conf /etc/X11/xorg.conf
sudo cp ~/.etc/X11/xorg.conf.d /etc/X11/xorg.conf.d
yaourt -S xmonad xmonad-contrib cabal-install slim terminator xmobar dmenu-xft trayer scrot xscreensaver feh parcellite pidgin network-manager-applet xfce4-notifyd gnome-keyring git nautilus ranger fcitx-im
cabal update && cabal install yeganesh
sudo systemctl enable NetworkManager
sudo systemctl enable slim
sudo pacman -S gtk-engine-murrine oxygen-icons oxygen-icons-svg xcursor-vanilla-dmz
ln -s ~/.linux/gtkrc-2.0 ~/.gtkrc-2.0
ln -s ~/.linux/config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini