Configurations of vecio's Arch Linux
====================================

For a long time, I've been using Arch Linux on an early 2013 15" rMBP. So these dot files are specific to Arch Linux and optimized to Retina display.


Themes
------

I use [Numix](https://github.com/shimmerproject/Numix) as GTK themes, and KDE's oxygen icons for the HiDPI screen.

    pacman -S gtk-engine-murrine oxygen-icons oxygen-icons-svg xcursor-vanilla-dmz

    ln -s ~/.linux/gtkrc-2.0 ~/.gtkrc-2.0
    ln -s ~/.linux/config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini


Xmonad
------

Its own guide is under the **xmonad** directory.


Vim
---

Just refer vimrc, I use default configurations for most plugins.
