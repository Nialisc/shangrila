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
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: let
    lib = inputs.snowfall-lib.mkLib {
      inherit inputs;
      src = ./.;

      snowfall = {
        meta = {
          name = "shangrila";
          title = "ShangriLa";
        };

        namespace = "shangrila";
      };
    };
  in
    lib.mkFlake {
      channels-config.allowUnfree = true;

      systems.modules = with inputs; [
        home-manager.nixosModules.home-manager
      ];
    };
}
