{
  pkgs,
  config,
  lib,
  ...
}:
with pkgs;
with config;

let
  color = import ../color.nix {};
  theme = import ../theme.nix {};
in
{
  programs.zsh = {
    enable = true;
    history.size = 1000000;
    history.save = 1000000;
    history.share = true;
    history.ignoreAllDups = true;
    history.ignoreSpace = true;
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      VIMCONFIG = "~/.config/nvim";
      VIMDATA = "~/.local/share/nvim";
      MANPAGER = "less -R --use-color -Dd+r -Du+b";
      MANROFFOPT = "-P -c";
    };
    initContent = lib.mkOrder 1000 ''
# group - no write
# other - no read, no write, no execute
umask 0027

export FZF_DEFAULT_OPTS="--preview 'bat --plain --color=always {}'"
export FZF_DEFAULT_COMMAND="fd --type f"
# Set up fzf shell integration, key bindings and fuzzy completion
[[ $(command -v "fzf") ]] && eval "$(fzf --zsh)"

BROOT_LAUNCHER="~/.config/broot/launcher/zsh/br"
if [ -f "$BROOT_LAUNCHER" ]; then
    source "$BROOT_LAUNCHER"
fi
      '';
  };

  programs.zsh = {
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "vi-mode" "sudo" ];
      theme = "robbyrussell";
    };
  };
}
