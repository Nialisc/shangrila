{ channels, ... }:

final: prev: {
  inherit (channels.unstable) rofi-wayland;
}