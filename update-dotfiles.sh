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
  --exclude='DIPS*' \
  --exclude='SharedStorage*' \
  --exclude='Singleton*' \
  /home/hero/.config/ \
  /home/hero/dotfiles/.config/

mkdir -p /home/hero/dotfiles/.local/bin
mkdir -p /home/hero/dotfiles/wallpapers

rsync -a --delete /home/hero/.local/bin/ /home/hero/dotfiles/.local/bin/
rsync -a --delete /home/hero/wallpapers/ /home/hero/dotfiles/wallpapers/

cd /home/hero/dotfiles
git status
