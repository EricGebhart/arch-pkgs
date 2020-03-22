packages := $(shell ls -d */ | sed 's,/,,')

# AUR packages
X11-apps-aur := yacreader vivaldi vivaldi-codecs-ffmpeg-extra-bin \
	slack-desktop shortwave
devel-aur := jekyll babashka-bin
Anbox := anbox-image-gapps anbox-modules-dkms-git anbox-bridge
aur-packages :=  $(X11-apps-aur) mu-git $(devel-aur) $(Anbox)

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
	cd $@; makepkg -si --noconfirm --needed

$(aur-packages):
	yay -S --noconfirm --needed $@

$(groups):
	sudo pacman -S --noconfirm --needed $@

# not necessary to list them, but it's clearer.
necessities: yay
emacs-pkg-setup: necessities natural-language mu-git
X11: xorg xorg-apps xorg-fonts X11-apps
X11-apps: yay audio $(X11-apps-aur)
Xfce: xfce4 xfce-goodies
audio: alsa shortwave
devel: yay $(devel-aur)
yay:
Xmonad:
natural-language:
mobile-studio-pro:
tablet:
anbox: $(Anbox)

base: necessities X11 audio Xmonad

git-sub-update:
	git submodule update --recursive --remote
