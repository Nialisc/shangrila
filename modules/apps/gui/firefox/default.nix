{ options, config, lib, pkgs, ... }:

with lib;
let 
  cfg = config.shangrila.apps.gui;
in
{
  config = mkIf cfg.enable {
    environment = {
      sessionVariables = {
        XDG_DESKTOP_DIR = "$HOME";
      };
    };

    shangrila.home.extraOptions = {
      programs.firefox = {
        enable = true;
        package = pkgs.firefox-wayland;

        profiles.${config.shangrila.user.name} = {
          id = 0;
          name = config.shangrila.user.name;
          settings = {
            "browser.aboutwelcome.enabled" = false;
            "browser.meta_refresh_when_inactive.disabled" = true;
            "browser.bookmarks.showMobileBookmarks" = false;
            "browser.urlbar.suggest.quicksuggest.sponsored" = false;
            "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
            "browser.aboutConfig.showWarning" = false;
            "browser.ssb.enabled" = true;
          };
        };
      };
    };
  };
}
