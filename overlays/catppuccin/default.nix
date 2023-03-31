{ channels, ... }:

final: prev: {
  inherit (channels.unstable) catppuccin-gtk;
}