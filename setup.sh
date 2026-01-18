#X11
ln -sf ~/dotfiles/config/.xinitrc ~/.xinitrc

#Zsh
pacman -S zsh
ln -sf ~/dotfiles/config/.zshrc ~/.zshrc

#Kitty config
pacman -S kitty
ln -sf ~/dotfiles/config/kitty.conf ~/.config/kitty/kitty.conf

#Fonts
pacman -S noto-fonts noto-fonts-extra
mkdir -p ~/.config/fontconfig
ln -s ~/dotfiles/config/fonts.conf ~/.config/fontconfig/fonts.conf

#Dunst
pacman -S dunst libnotify
mkdir ~/.config/dunst
ln -s ~/dotfiles/config/dunstrc ~/.config/dunst/dunstrc

#Screenshot
pacman -S scrot xclip xdotool

