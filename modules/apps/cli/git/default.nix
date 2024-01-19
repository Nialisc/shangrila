{ options, config, lib, pkgs, ... }:

with lib;
with lib.shangrila;
let cfg = config.shangrila.apps.cli;
in
{
  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ git ]; };
}
