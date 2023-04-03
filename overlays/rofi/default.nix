{ channels, ... }:

final: prev: {
  inherit (channels.unstable) rofi-wayland;
  inherit (channels.unstable) rofi;
}