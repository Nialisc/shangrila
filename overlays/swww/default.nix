{ channels, ... }:

final: prev: {
  inherit (channels.unstable) swww;
}