{
  pkgs,
  config,
  ...
}:

let
  color = import ../color.nix {};
  theme = import ../theme.nix {};
in
{
  programs = {
    bat = {
      enable = true;
      config = {
          style = "plain";
          theme = "Dracula";
        };
    };
  };
}
