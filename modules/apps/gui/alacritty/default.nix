{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui.alacritty;
in
{
  options.shangrila.apps.gui.alacritty = with types; {
    enable = mkBoolOpt false "Whether or not to enable alacritty.";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ alacritty ];
      sessionVariables = {
        TERMINAL = "alacritty";
      };
    };
  };
}
