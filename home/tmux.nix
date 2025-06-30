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
  programs = {
    # the configuration module for tmux
    # is rather bad
    # use extraConfig
    tmux = {
      enable = true;
      shell = "${pkgs.bash}/bin/bash";
      keyMode = "vi";
      terminal = "tmux-256color";
      extraConfig = ''
        set -ga terminal-overrides ",st-256color:Tc"

        set -g @plugin 'Nybkox/tmux-kanagawa'
        set -g @kanagawa-theme 'wave'

        run '~/.config/tmux/plugins/tpm/tpm'
      '';
    };
  };
}
