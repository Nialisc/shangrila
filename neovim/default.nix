{ unstable, config, env, ... }:

{
  home.packages = with unstable; [ neovim ];

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${env.directory}/home/neovim/config";
    recursive = true;
  };
}