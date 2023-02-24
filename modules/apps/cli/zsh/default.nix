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
        fonts = "fc-list | grep -i 'fira' | column -t -s':'"
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

          plugins = [];
        };
      };
    };

    shangrila.user.extraOptions.shell = pkgs.zsh;
  };
}
