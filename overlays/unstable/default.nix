{ channels, ... }:

final: prev: {
  inherit (channels.unstable) yt-dlp;
  inherit (channels.unstable) catppuccin-gtk;
  inherit (channels.unstable) slack;
  inherit (channels.unstable) neovim;
  inherit (channels.unstable) mpv;
  inherit (channels.unstable) wofi;
}