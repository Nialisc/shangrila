{ channels, ... }:

final: prev: {
  inherit (channels.unstable) slack;
}