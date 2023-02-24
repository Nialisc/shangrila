{ options, config, pkgs, lib, inputs, ... }:

with lib;
let cfg = config.shangrila.home;
in
{
  imports = with inputs; [
    home-manager.nixosModules.home-manager
  ];

  options.shangrila.home = with types; {
    configFile = mkOpt attrs { }
      "A set of files to be managed by home-manager's <option>xdg.configFile</option>.";
    extraOptions = mkOpt attrs { } "Options to pass directly to home-manager.";
  };

  config = {
    shangrila.home.extraOptions = {
      home.stateVersion = config.system.stateVersion;
      xdg.enable = true;
      xdg.configFile = mkAliasDefinitions options.shangrila.home.configFile;
    };

    home-manager = {
      useUserPackages = true;

      users.${config.shangrila.user.name} =
        mkAliasDefinitions options.shangrila.home.extraOptions;
    };
  };
}
