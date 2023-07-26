{ options, config, pkgs, lib, inputs, ... }:

with lib;
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
      flyctl
      ffmpeg
      just
      yt-dlp
      unzip
      xclip
    ];
  };
}
