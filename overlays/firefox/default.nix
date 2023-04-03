{ channels, ... }:

final: prev: {
  inherit (channels.unstable) firefox-wayland;
  inherit (channels.unstable) firefox;
}