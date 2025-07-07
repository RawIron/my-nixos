{ ... }:

{
  # link the configuration file in current directory
  # to the specified location in home directory
  home.file.".config/nvim/init.vim".source = ./init.vim;

  programs = {
    neovim = {
      enable = true;
    };
  };
}
