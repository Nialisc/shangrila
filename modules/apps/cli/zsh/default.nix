{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.cli.zsh;
in
{
  options.shangrila.apps.cli.zsh = with types; {
    enable = mkBoolOpt false "Whether or not to enable zsh.";
  };

  config = mkIf cfg.enable {
    shangrila.home.extraOptions = {
      home.shellAliases = {
        ll = "${pkgs.colorls}/bin/colorls --sd";
        lcg = "lc --gs";
        lcl = "lc -1";
        lclg = "lc -1 --gs";
        lcu = "${pkgs.colorls}/bin/colorls -U";
        lclu = "${pkgs.colorls}/bin/colorls -U -1";
      };

      programs = {
        starship = {
          enable = true;
          settings = {
            character = {
              success_symbol = "[>](bold green)";
              error_symbol = "[✗](bold red) ";
              vicmd_symbol = "[](bold blue) ";
            };
          };
        };

        zsh = {
          enable = true;
          enableCompletion = true;
          enableAutosuggestions = true;
          enableSyntaxHighlighting = true;

          initExtra = ''
            set -o vi
            source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
          '';

          plugins = [];
        };
      };
    };
  };
}
