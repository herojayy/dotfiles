#!/usr/bin/env bash
set -e

DOTFILES="/home/hero/dotfiles"

mkdir -p "$DOTFILES/.config"
mkdir -p "$DOTFILES/.local/bin"
mkdir -p "$DOTFILES/.local/share"
mkdir -p "$DOTFILES/wallpapers"

sync_config() {
  local name="$1"
  if [ -e "/home/hero/.config/$name" ]; then
    rsync -a --delete \
      --exclude='.git/' \
      --exclude='cache/' \
      --exclude='Cache/' \
      --exclude='CachedData/' \
      --exclude='GPUCache/' \
      --exclude='Code Cache/' \
      --exclude='storage/' \
      --exclude='Service Worker/' \
      --exclude='File System/' \
      --exclude='DawnGraphiteCache/' \
      --exclude='DawnWebGPUCache/' \
      --exclude='IndexedDB/' \
      --exclude='Local Storage/' \
      --exclude='Session Storage/' \
      --exclude='WebStorage/' \
      --exclude='workspaceStorage/' \
      --exclude='History/' \
      --exclude='TransportSecurity' \
      --exclude='Network Persistent State' \
      --exclude='Cookies' \
      --exclude='sentry/' \
      --exclude='profiler_data/' \
      --exclude='globalStorage/' \
      --exclude='*.log' \
      --exclude='*.zwc' \
      --exclude='.zcompdump*' \
      "/home/hero/.config/$name/" \
      "$DOTFILES/.config/$name/"
  fi
}

# Core OS / desktop configs
sync_config "hypr"
sync_config "waybar"
sync_config "rofi"
sync_config "ghostty"
sync_config "nvim"
sync_config "zsh"
sync_config "oh-my-zsh"
sync_config "fastfetch"
sync_config "swaync"
sync_config "wlogout"
sync_config "gtk-2.0"
sync_config "gtk-3.0"
sync_config "gtk-4.0"
sync_config "Kvantum"
sync_config "qt6ct"
sync_config "nwg-look"
sync_config "fontconfig"
sync_config "xsettingsd"
sync_config "Thunar"
sync_config "auto_walls"
sync_config "themesw"
sync_config "pacman"
sync_config "htop"
sync_config "nvtop"

# Extra configs you want to keep
sync_config "gammastep"
sync_config "sillyfetch"

# Single config files
cp /home/hero/.config/kdenliverc "$DOTFILES/.config/" 2>/dev/null || true
cp /home/hero/.config/mimeapps.list "$DOTFILES/.config/" 2>/dev/null || true
cp /home/hero/.config/user-dirs.dirs "$DOTFILES/.config/" 2>/dev/null || true
cp /home/hero/.config/electron-flags.conf "$DOTFILES/.config/" 2>/dev/null || true
cp /home/hero/.config/QtProject.conf "$DOTFILES/.config/" 2>/dev/null || true
cp /home/hero/.config/pavucontrol.ini "$DOTFILES/.config/" 2>/dev/null || true
cp /home/hero/.config/wgetrc "$DOTFILES/.config/" 2>/dev/null || true

# User scripts
rsync -a --delete /home/hero/.local/bin/ "$DOTFILES/.local/bin/"

# Wallpapers
rsync -a --delete /home/hero/wallpapers/ "$DOTFILES/wallpapers/"

# Selected .local/share only
rsync -a --delete /home/hero/.local/share/applications/ "$DOTFILES/.local/share/applications/"
rsync -a --delete --exclude='pid.lock' /home/hero/.local/share/auto_walls/ "$DOTFILES/.local/share/auto_walls/"
rsync -a --delete /home/hero/.local/share/hyprland/ "$DOTFILES/.local/share/hyprland/"
rsync -a --delete /home/hero/.local/share/nwg-dock-hyprland/ "$DOTFILES/.local/share/nwg-dock-hyprland/"
rsync -a --delete /home/hero/.local/share/sddm/ "$DOTFILES/.local/share/sddm/"
rsync -a --delete /home/hero/.local/share/templates/ "$DOTFILES/.local/share/templates/"

cp /home/hero/.local/share/nvim.desktop "$DOTFILES/.local/share/" 2>/dev/null || true

cd "$DOTFILES"
git status
