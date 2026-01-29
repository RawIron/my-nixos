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
      # use oh-my-zsh plugin colored-man-pages instead
      #MANPAGER = "less -R --use-color -Dd+r -Du+b";
      #MANROFFOPT = "-P -c";
    };
    initContent = lib.mkOrder 1000 ''
# group - no write
# other - no read, no write, no execute
umask 0027


# create a full‑width thin line
fullwidth_line() {
  # line character & colour
  local char='\u2500'                # ─
  local color='\e[38;5;240m'         # grey (256‑color)
  local reset='\e[0m'
  local cols=$COLUMNS
  printf "$color$char%.0s$reset" {1..$cols}
}

# print the line before every prompt
precmd() {
  print $(fullwidth_line)
}


# fzf
# for now these configs have to be here
# see fzf.nix

# "**" command syntax
_fzf_compgen_path() {
  fd --hidden --follow . "$1"
}

# "**" command syntax (for directories only)
_fzf_compgen_dir() {
  fd --type d --hidden --follow . "$1"
}


BROOT_LAUNCHER="~/.config/broot/launcher/zsh/br"
if [ -f "$BROOT_LAUNCHER" ]; then
    source "$BROOT_LAUNCHER"
fi
      '';
  };

  programs.zsh = {
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "vi-mode" "colored-man-pages" "sudo" ];
      theme = "robbyrussell";
    };
  };
}
