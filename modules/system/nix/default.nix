{ options, config, pkgs, lib, ... }:

with lib;
with lib.shangrila;
let 
  cfg = config.shangrila.system;
  customCfg = config.shangrila.system.nix;
in
{
  options.shangrila.system.nix = with types; {
    package = mkOpt package pkgs.nix "Which nix package to use.";
  };

  config = mkIf cfg.enable {
    nix =
      let users = [ "root" config.shangrila.user.name ];
      in
      {
        package = customCfg.package;
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
          substituters = [
            "https://cache.nixos.org?priority=10"
          ];
          trusted-public-keys = [
            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          ];
          extra-trusted-substituters = [ "https://cache.floxdev.com" ];
          extra-trusted-public-keys = [ "_FLOX_PUBLIC_KEYS()" ];
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
