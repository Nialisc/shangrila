{ channels, ... }:

final: prev: {
  inherit (channels.unstable) mpv;
}