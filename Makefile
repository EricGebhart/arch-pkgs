packages := $(shell ls -d */ | sed 's,/,,')
aur-packages := yacreader vivaldi vivaldi-codecs-ffmpeg-extra-bin mu-git jekyll babashka-bin

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

$(aur-packages):
	yay -S --noconfirm $@

$(groups):
	sudo pacman -S --noconfirm $@


# not necessary to list them, but it's clearer.
necessities: yay
emacs: necessities natural-language mu-git
X11: xorg xorg-apps xorg-fonts X11-apps
X11-apps: audio yacreader vivaldi vivaldi-codecs-ffmpeg-extra-bin
Xfce: xfce4 xfce-goodies
audio: alsa
devel: jekyll babashka-bin
yay:
Xmonad:
natural-language:
mobile-studio-pro:
tablet:

base: necessities X11 audio Xmonad
