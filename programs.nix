{ pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # GUI APPLICATIONS
    feh
    rofi
    firefox
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
