{ options, config, pkgs, lib, inputs, ... }:

with lib;
with lib.shangrila;
let cfg = config.shangrila.apps.cli;
in
{
  options.shangrila.apps.cli = with types; {
    enable = mkBoolOpt false "Whether or not to enable cli apps.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      killall
      wget
      btop
      fzf
      ranger
      neofetch
      lazygit
      steam-run
      gnumake
      ffmpeg
      just
      yt-dlp
      unzip
      xclip
    ];
  };
}
