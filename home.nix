{ config, pkgs, ... }:

{
  # This value determines the home Manager release that your
  # configuration is compatible with.
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "michael";
  home.homeDirectory = "/home/michael";

  # link the configuration file in current directory
  # to the specified location in home directory
  home.file.".bashrc".source = ./bashrc;
  home.file.".bash_aliases".source = ./bash_aliases;
  home.file.".bash_aliases_git".source = ./bash_aliases_git;
  home.file.".config/tmux/tmux.conf".source = ./tmux.conf;
  home.file.".config/nvim/init.vim".source = ./init.vim;
  home.file.".config/vifm/vifmrc".source = ./vifmrc;
  home.file.".config/vifm/scripts/ffprobe_jq.sh".source = ./ffprobe_jq.sh;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  wayland = {
    windowManager = {
      sway = {
        enable = true;
        config = {
          input = {
            "type:touchpad" = {
              dwt = "enabled";
              tap = "enabled";
              natural_scroll = "enabled";
              middle_emulation = "enabled";
              accel_profile = "flat";
              pointer_accel = "1.0";
            };
            "type:pointer" = {
              natural_scroll = "enabled";
            };
            "type:mouse" = {
              natural_scroll = "disabled";
            };
          };
        };
      };
    };
  };

  home.sessionVariables = {
    # Session
    # https://github.com/swaywm/sway/wiki#xdg_current_desktop-environment-variable-is-not-being-set
    XDG_CURRENT_DESKTOP = "sway";
    XDG_SESSION_DESKTOP = "sway";
    XDG_SESSION_TYPE = "wayland";

    # Wayland
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_USE_XINPUT2 = "1";
    SDL_VIDEODRIVER = "wayland";
    # https://github.com/swaywm/sway/wiki#my-favorite-application-isnt-displayed-right-how-can-i-fix-this
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

    # GTK Theme
    # https://github.com/swaywm/sway/wiki/GTK-3-settings-on-Wayland
    GTK_THEME= "Breeze-Dark";
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # GUI APPLICATIONS
    feh
    rofi
    zathura
    calibre
    rawtherapee
    signal-desktop
    protonvpn-gui

    # TTY
    tmux
    st
    rxvt-unicode-unwrapped

    # COMMAND LINE TOOLS
    neovim
    rclone
    git
    tig
    diff-so-fancy
    vifm
    poppler_utils
    lynx
    chafa
    timg
    glow # markdown previewer in terminal
    ffmpeg_6
    ffmpegthumbnailer
    mpv
    epub-thumbnailer
    encfs
    universal-ctags
    cloc
    scc
    ltrace # library call monitoring
    fzf # A command-line fuzzy finder
    fd
    ripgrep # recursively searches directories for a regex pattern
    bat
    broot
    tree
    eza # A modern replacement for ls
    lsof # list open files
    ncdu
    dust
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    tealdeer
    fastfetch
    nmon
    htop
    atop
    iotop # io monitoring
    iftop # network monitoring
    curl
    wget
  ];
}
