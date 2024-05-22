{ pkgs, env, ... }:

{
  time.timeZone = env.timezone;

  i18n = {
    defaultLocale = env.locale;
    extraLocaleSettings = {
      LC_ADRESS = env.locale;
      LC_IDENTIFICATION = env.locale;
      LC_MEASUREMENT = env.locale;
      LC_MONETARY = env.locale;
      LC_NAME = env.locale;
      LC_NUMERIC = env.locale;
      LC_PAPER = env.locale;
      LC_TELEPHONE = env.locale;
      LC_TIME = env.locale;
    };
  };

  console = {
    keyMap = env.keymap;
  };

  services.xserver = {
    layout = env.keymap;
    xkbVariant = env.keymap_variant;
  }
}