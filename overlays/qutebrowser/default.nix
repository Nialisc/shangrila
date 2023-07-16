{ channels, ... }:

final: prev: {
  inherit (channels.unstable) qutebrowser;
}