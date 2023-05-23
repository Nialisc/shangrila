{ channels, ... }:

final: prev: {
  inherit (channels.unstable) yt-dlp;
}