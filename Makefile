packages := $(shell ls -d */ | sed 's,/,,')

all: $(packages)

print-%  : ; @echo $* = $($*)

clean:
	rm -f */*.xv
	rm -rf */src
	rm -rf */pkg

.PHONY: $(packages)

$(packages):
	cd $@; makepkg -si --noconfirm; cd -

necessities:
dotfiles:
emacs:
yay:
X11: X11-apps
X11-apps:
Xmonad:
devel:
natural-language:
mobile-studio-pro:
tablet:

base: X11 X11-apps necessities dotfiles Xmonad yay
