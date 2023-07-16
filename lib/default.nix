{ lib, inputs, snowfall-inputs }:

rec {
  override-meta = meta: package:
    package.overrideAttrs (_: {
      inherit meta;
      propagateBuildInputs = [
        inputs.nixpkgs.ncurses
      ];
    });
  mkSymlink = inputs.home-manager.file.mkOutOfStoreSymlink;
}
