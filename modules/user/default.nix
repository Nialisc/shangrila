{ options, config, pkgs, lib, ... }:

with lib;
let cfg = config.shangrila.user;
in
{
  options.shangrila.user = with types; {
    name = mkOpt str "nialis" "The name to use for the user account.";
    fullName = mkOpt str "Sylvain Colignon" "The full name of the user.";
    email = mkOpt str "sylvain.colignon@nialis.xyz" "The email of the user.";
    initialPassword = mkOpt str "password"
      "The initial password to use when the user is first created.";
    extraGroups = mkOpt (listOf str) [ ] "Groups for the user to be assigned.";
    extraOptions = mkOpt attrs { }
      "Extra options passed to <option>users.users.<name></option>.";
  };

  config = {
    environment.sessionVariables = {
      LOCATION = "~/.nix";
      PATH = "$PATH:$LOCATION/scripts";
    };
    
    shangrila.home.extraOptions = {
      home.file = {
        "Documents/.keep".text = "";
        "Downloads/.keep".text = "";
        "Music/.keep".text = "";
        "Pictures/.keep".text = "";
        "Videos/.keep".text = "";
        "Work/.keep".text = "";
        "PersonnalWork/.keep".text = "";
      };
    };

    users.users.${cfg.name} = {
      isNormalUser = true;

      inherit (cfg) name initialPassword;

      home = "/home/${cfg.name}";
      group = "users";

      uid = 1000;
      extraGroups = [ "wheel" "networkmanager" ] ++ cfg.extraGroups;
    } // cfg.extraOptions;
  };
}
