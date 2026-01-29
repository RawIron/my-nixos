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
    fzf = {   # command-line fuzzy finder
      enable = true;
      enableZshIntegration = true;
      # use fd instead of find (fd reads .config/fd/ignore)
      defaultCommand = "fd --type f --hidden";
      defaultOptions = [ "--preview 'bat --plain --color=always {}'" ];
      # alt-c
      changeDirWidgetCommand = "fd --type d --hidden";
      #changeDirWidgetOptions
      # ctrl-t
      fileWidgetCommand = "fd --type f --hidden";
      #fileWidgetOptions = 
      # ctrl-r
      historyWidgetOptions = [ "--no-preview" "--border" ];
    # there is no extraConfig
    # see zsh.nix for extra configs
    };
  };
}
