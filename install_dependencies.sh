EXTRA=( btop lazygit stow neofetch fzf zip unzip wget curl bzip2 mpc mpd vim yazi bat eza zsh neovim tmux git dust github-cli fd rg flameshot dunst dmenu i3 thunar tiled tokei zsh-autosuggestions zsh-syntax-highlighting ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji adwaita-fonts )

AUR=( ueberzugpp-debug seer-gdb oh-my-posh-bin clipboard-bin ttf-material-design-icons-extended ttf-icomoon-feather-git ttf-poppins )

echo "Installing official packages..."
sudo pacman -Syu --needed "${EXTRA[@]}"

if command -v paru &>/dev/null; then
    AUR_HELPER="paru"
elif command -v yay &>/dev/null; then
    AUR_HELPER="yay"
else
    echo "No AUR helper (paru/yay) found. Skipping AUR packages."
    exit 0
fi

echo "Installing AUR packages with $AUR_HELPER..."
"$AUR_HELPER" -S --needed "${AUR[@]}"
