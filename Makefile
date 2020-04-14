packages := $(shell ls -d */ | sed 's,/,,')

# AUR packages
X11-apps-aur := yacreader slack-desktop shortwave\
	vivaldi vivaldi-ffmpeg-codecs \

# for some reason touchegg needs xorgproto-git at the moment.
tablet-apps-aur := xorgproto-git touchegg-qt5 iio-sensor-proxy-git screenrotator-git
devel-aur := jekyll babashka-bin qmk boot
Anbox := anbox-git anbox-modules-dkms-git
games-aur := pcsxr rpcs3-git libretro-pcsx2
aur-packages :=  $(X11-apps-aur) mu-git rar $(devel-aur) \
	$(Anbox) $(tablet-apps-aur) $(games-aur)

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
necessities: yay rar
emacs-pkg-setup: necessities natural-language mu-git
X11: xorg xorg-apps xorg-fonts X11-apps
X11-apps: yay audio $(X11-apps-aur)
Xfce: xfce4 xfce-goodies
audio: alsa shortwave
devel: yay $(devel-aur)
yay:
games: $(games-aur)
Xmonad:
natural-language:
mobile-studio-pro:
tablet: $(tablet-apps-aur)
anbox: $(Anbox)

base: necessities X11 audio Xmonad

git-sub-update:
	git submodule update --recursive --remote
