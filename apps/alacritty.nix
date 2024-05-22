{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [ alacritty ];
    sessionVariables = {
      TERMINAL = "alacritty";
    };
  };
}