{
  description = "Personnal NixOS setup for my everyday use";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url =
      "github:nix-community/home-manager/release-22.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
  let
    lib = inputs.snowfall-lib.mkLib {
      inherit inputs;
      src = ./.;
    };
  in
    lib.mkFlake {
      package-namespace = "shangrila";
      channels-config.allowUnfree = true;

      systems.modules = with inputs; [
        home-manager.nixosModules.home-manager
      ];
    };
}
