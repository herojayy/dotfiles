#!/usr/bin/env bash
set -e

rsync -a --delete \
  --exclude='.git/' \
  --exclude='.zcompdump*' \
  --exclude='*.zwc' \
  --exclude='discord/' \
  --exclude='net.imput.helium/' \
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
  --exclude='DIPS*' \
  --exclude='SharedStorage*' \
  --exclude='Singleton*' \
  /home/hero/.config/ \
  /home/hero/dotfiles/.config/

mkdir -p /home/hero/dotfiles/.local/bin
mkdir -p /home/hero/dotfiles/wallpapers
mkdir -p /home/hero/dotfiles/.local/share

rsync -a --delete /home/hero/.local/bin/ /home/hero/dotfiles/.local/bin/
rsync -a --delete /home/hero/wallpapers/ /home/hero/dotfiles/wallpapers/

rsync -a --delete /home/hero/.local/share/applications/ /home/hero/dotfiles/.local/share/applications/
rsync -a --delete /home/hero/.local/share/auto_walls/ /home/hero/dotfiles/.local/share/auto_walls/
rsync -a --delete /home/hero/.local/share/hyprland/ /home/hero/dotfiles/.local/share/hyprland/
rsync -a --delete /home/hero/.local/share/nwg-dock-hyprland/ /home/hero/dotfiles/.local/share/nwg-dock-hyprland/
rsync -a --delete /home/hero/.local/share/sddm/ /home/hero/dotfiles/.local/share/sddm/
rsync -a --delete /home/hero/.local/share/templates/ /home/hero/dotfiles/.local/share/templates/

cp /home/hero/.local/share/nvim.desktop /home/hero/dotfiles/.local/share/ 2>/dev/null || true

cd /home/hero/dotfiles
git status
