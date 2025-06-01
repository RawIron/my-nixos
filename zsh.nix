{
  pkgs,
  config,
  ...
}:
with pkgs;
with config;

let
  color = import ./color.nix {};
  theme = import ./theme.nix {};
in
{
  programs.zsh = {
    enable = true;
    history.size = 1000000;
    history.save = 1000000;
    history.share = true;
    history.ignoreAllDups = true;
    history.ignoreSpace = true;
  };

  programs.zsh = {
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      theme = "robbyrussell";
    };
  };
}
