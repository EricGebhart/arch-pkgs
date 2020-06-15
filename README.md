# Arch Linux metapackages

A set of meta-packages for simplifying a system install.

This is really simple. There's nothing but meta packages here.

You can of course just do a `makepkg -si` in each of these packages
to install them.  Or you can clone my [Arch-Setup](http://github.com/ericgebhart/Arch-Setup) 
repo and get a script to install these along with other things that will make the configurations
more complete. 

## Use Make
So this is just meta-packages, but metapackages only work for the official arch-repos. So
That leaves out the things in the AUR. I get around that in the Makefile. So just
`make <package-name>` so it can do all the pacman stuff and the AUR stuff.
Make takes care of things like other sources and dependencies.

## Bigger picture.
This project is wrapped by another project. [Arch-Setup](https://github.com/ericgebhart/Arch-Setup)
That project combines this one with all of my configuration and setup repositories. So if you
clone that with recurse submodules, you will get a higher level Makefile with additional repos
for configuration and setup.

## the packages.
 * yay - An installer for the AUR.
 * X11 - Xorg, xorg-apps etc.
 * X11-apps - libreoffice, vivaldi, audacity, dolphin, network-manager-applet, etc.
 * Xmonad - xmonad, xmonad-contrib, ghci, polybar, dmenu, dzen2, rofi, conky, etc.
 * Xfce4 and xfce4-goodies - Xfce
 * emacs - emacs, isync, mu4e, languagetool hunspell
 * devel - clojure, python, openSCAD, etc.
 * natural-language - languagetool, anki, hunspell
 * mobile-studio-pro - necessities for an MSP, nvidia...
 * tablet - various apps like krita, blender, gimp, cellwriter, easystroke, onboard, Xournalpp, etc.
 * natural-language - languagetool, anki, hunspell dictionaries, etc.
 * maker - arduino, qmk, ARM tools, kicad, openSCAD, repetier-host, circuits and 3D printing stuff.



# See Also:

[Arch Linux; Creating an automated install and personal Setup](http://ericgebhart.com/blog/code/2020-03-15-Arch-Linux/)

* [hosting an arch linux repository in an amazon s3 bucket]: https://disconnected.systems/blog/archlinux-repo-in-aws-bucket
* [managing arch linux with meta packages]: https://disconnected.systems/blog/archlinux-meta-packages
* [creating a custom arch linux installer]: https://disconnected.systems/blog/archlinux-installer

