{ channels, ... }:

final: prev: {
  inherit (channels.unstable) yt-dlp;
  inherit (channels.unstable) catppuccin-gtk;
  inherit (channels.unstable) vieb;
  inherit (channels.unstable) swww;
  inherit (channels.unstable) slack;
  inherit (channels.unstable) rofi;
  inherit (channels.unstable) neovim;
  inherit (channels.unstable) mpv;
  inherit (channels.unstable) flyctl;
  inherit (channels.unstable) firefox;
}