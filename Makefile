packages := $(shell ls -d */ | sed 's,/,,' | sed 's/yay//')
aur-packages := yacreader vivaldi vivaldi-codecs-ffmpeg-extra-bin mu-git jekyll babashka-bin

# groups cannot be installed via dependencies in PKGBUILD
groups := xorg xorg-apps xorg-fonts alsa xfce4 xfce-goodies

everything := $(packages) $(groups) $(aur-packages)

all: $(everything)

print-%  : ; @echo $* = $($*)

clean:
	rm -f */*.xv
	rm -f */*.xz
	rm -rf */src
	rm -rf */pkg

.PHONY: $(everything)

$(packages):
	cd $@; makepkg -si --noconfirm

$(aur-packages):
	yay -S --noconfirm $@

$(groups):
	sudo pacman -S --noconfirm $@

### this needs some work. But it's close.
/usr/bin/yay:
	cd $@; makepkg -si --noconfirm

# not necessary to list them, but it's clearer.
necessities: yay
emacs: necessities natural-language mu-git
X11: xorg xorg-apps xorg-fonts X11-apps
X11-apps: audio yacreader vivaldi vivaldi-codecs-ffmpeg-extra-bin
Xfce: xfce4 xfce-goodies
audio: alsa
devel: jekyll babashka-bin
yay: /usr/bin/yay
Xmonad:
natural-language:
mobile-studio-pro:
tablet:

base: necessities X11 audio Xmonad
