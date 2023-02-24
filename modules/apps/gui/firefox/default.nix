{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui.firefox;
in
{
  options.shangrila.apps.gui.firefox = with types; {
    enable = mkBoolOpt false "Whether or not to enable firefox.";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ firefox ];
      sessionVariables = {
        XDG_DESKTOP_DIR = "$HOME";
      };
    };
  };
}
