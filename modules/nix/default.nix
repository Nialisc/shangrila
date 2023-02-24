{ options, config, pkgs, lib, ... }:

with lib;
with lib.internal;
let cfg = config.shangrila.nix;
in
{
  options.shangrila.nix = with types; {
    enable = mkBoolOpt true "Whether or not to manage nix configuration.";
    package = mkOpt package pkgs.nix "Which nix package to use.";
  };

  config = mkIf cfg.enable {
    nix =
      let users = [ "root" config.shangrila.user.name ];
      in
      {
        package = cfg.package;
        extraOptions = lib.concatStringsSep "\n" [
          ''
            experimental-features = nix-command flakes
            http-connections = 50
            warn-dirty = false
            log-lines = 50
            sandbox = relaxed
          ''
        ];

        settings = {
          experimental-features = "nix-command flakes";
          http-connections = 50;
          warn-dirty = false;
          log-lines = 50;
          sandbox = "relaxed";
          auto-optimise-store = true;
          trusted-users = users;
          allowed-users = users;
        };

        gc = {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 30d";
        };

        # flake-utils-plus
        generateRegistryFromInputs = true;
        generateNixPathFromInputs = true;
        linkInputs = true;
      };
  };
}
