{ pkgs, env, ... }:

{
  users.users."${env.user.username}" = {
    isNormalUser = true;
    description = env.user.fullname;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}