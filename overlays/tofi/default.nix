{ channels, ... }:

final: prev: {
  inherit (channels.unstable) tofi;
}