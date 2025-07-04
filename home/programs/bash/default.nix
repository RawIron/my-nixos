{ ... }:

{
  # link the configuration file in current directory
  # to the specified location in home directory
  home.file.".bashrc".source = ./bashrc;
  home.file.".bash_aliases".source = ./bash_aliases;
  home.file.".bash_aliases_git".source = ./bash_aliases_git;
}
