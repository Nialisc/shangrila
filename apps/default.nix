{ pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./alacritty.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    neovim
    alacritty
    brave
    kitty
  ];
}