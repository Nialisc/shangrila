{ channels, ... }:

final: prev: {
  inherit (channels.unstable) zoom-us;
}