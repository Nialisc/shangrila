{
  description = "Peace of mind for dev env";

  inputs = {
    nixpgs.url = "nixpkgs/23.11";
  };

  outputs = inputs@{ nixpkgs, ... }:
  let
    system = "x86_64-linux";

    env = {
      user = {
        username = "nialis";
        fullname = "Sylvain Colinon";
        email = "sylvain.colignon@nialis.xyz";
      };

      hostname = "shangrila";
      locale = "fr_FR.UTF-8";
      timezone = "Europe/Paris";
      keymap = "us";
      keymap_variant = "";
      directory = "/home/${env.user.username}/.dotfiles";
    };

    pkgs = import nixpkgs {
      inherit system;
      config = {
	      allowUnfree = true;
      };
    };
  in {
    templates = {
      default = {
        description = ''
          Shangrila
        '';
        path = ./.;
      };
    };
    nixosConfigurations = {
      "${env.hostname}" = nixpkgs.lib.nixosSystem {
	      specialArgs = { 
          inherit system;
          inherit env;
        };
	      modules = [
          ./system/default.nix
          ./apps/default.nix
        ];
      };
    };
  };
}
