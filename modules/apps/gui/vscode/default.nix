{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.gui.vscode;
in
{
  options.shangrila.apps.gui.vscode = with types; {
    enable = mkBoolOpt false "Whether or not to enable vscode.";
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ vscode ];
    };
    shangrila.home.configFile."Code/User/settings.json" = {
      source = ./config;
    };
  };
}
