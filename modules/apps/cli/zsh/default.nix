{ options, config, lib, pkgs, ... }:

with lib;
with lib.shangrila;
let cfg = config.shangrila.apps.cli;
in
{
  config = mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      autosuggestions.enable = true;
      histFile = "$XDG_CACHE_HOME/zsh.history";
    };
    
    shangrila.home.extraOptions = {
      home.shellAliases = {
        ll = "ls -lsh --color";
        lla = "ls -lsah --color";
        fonts = "fc-list | column -t -s':'";
      };

      programs = {
        starship = {
          enable = true;
          settings = {
            add_newline = false;
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
        };
      };
    };

    shangrila.user.extraOptions.shell = pkgs.zsh;
  };
}
