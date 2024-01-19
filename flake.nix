{
  description = "Personnal NixOS setup for my everyday use";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url =
        "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    snowfall-lib = {
      url = "github:snowfallorg/lib?ref=v2.1.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      src = ./.;

      snowfall = {
        namespace = "shangrila";

        meta = {
          name = "ShangriLa";
          title = "Personnal NixOS setup for my everyday use";
        };
      };

      channels-config.allowUnfree = true;
      systems.modules.nixos = with inputs; [
        home-manager.nixosModules.home-manager
      ];
    };
}
