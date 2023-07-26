{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.shangrila.apps.cli;
in
{
  config = mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [ neovim ripgrep ];
      sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
      };
    };

    shangrila.home.extraOptions = hm: {
      home.file.".config/nvim" = {
        source =
          hm.config.lib.file.mkOutOfStoreSymlink "/home/${config.shangrila.user.name}/.nix/modules/apps/cli/neovim/config";
        recursive = true;
      };
    };
  };
}
