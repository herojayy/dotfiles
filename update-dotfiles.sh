#!/usr/bin/env bash
set -e

DOTFILES="/home/hero/dotfiles"

mkdir -p "$DOTFILES/.config"
mkdir -p "$DOTFILES/.local/bin"
mkdir -p "$DOTFILES/.local/share"
mkdir -p "$DOTFILES/wallpapers"

# Selected .config folders only
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

# Add/remove config folders here
sync_config "hypr"
sync_config "waybar"
sync_config "rofi"
sync_config "ghostty"
sync_config "nvim"
sync_config "zsh"
sync_config "oh-my-zsh"
sync_config "gtk-3.0"
sync_config "gtk-4.0"
sync_config "Thunar"
sync_config "fastfetch"
sync_config "swaync"
sync_config "wlogout"
sync_config "auto_walls"
sync_config "obs-studio"

# Selected .local/bin
rsync -a --delete \
  /home/hero/.local/bin/ \
  "$DOTFILES/.local/bin/"

# Wallpapers
rsync -a --delete \
  /home/hero/wallpapers/ \
  "$DOTFILES/wallpapers/"

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
