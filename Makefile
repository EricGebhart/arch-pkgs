packages := $(shell ls -d */ | sed 's,/,,')

# groups cannot be installed via dependencies in PKGBUILD
groups := xorg xorg-apps xorg-fonts alsa xfce4 xfce-goodies

all: $(packages) $(groups)

print-%  : ; @echo $* = $($*)

clean:
	rm -f */*.xv
	rm -f */*.xz
	rm -rf */src
	rm -rf */pkg

.PHONY: $(packages) $(groups)

$(packages):
	cd $@; makepkg -si --noconfirm; cd -

$(groups):
	sudo pacman -S --noconfirm $@


# not necessary to list them, but it's clearer.
necessities:
dotfiles:
emacs:
yay:
X11: xorg xorg-apps xorg-fonts X11-apps
X11-apps: audio
Xfce: xfce4 xfce-goodies
audio: alsa
Xmonad:
devel:
natural-language:
mobile-studio-pro:
tablet:

base: X11 X11-apps audio necessities dotfiles Xmonad yay
