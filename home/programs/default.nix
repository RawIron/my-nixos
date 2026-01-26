{ pkgs, ... }:

{
  imports = [
    ./bash
    ./nvim
    ./vifm
    ./zsh.nix
    ./tmux.nix
    ./fd.nix
  ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # GUI APPLICATIONS
    feh
    firefox
    zathura
    calibre
    rawtherapee
    signal-desktop
    protonvpn-gui

    # TTY
    st
    rxvt-unicode-unwrapped
    alacritty

    # DEVELOPMENT
    gcc
    gdb
    gnumake
    #clang
    include-what-you-use

    zulu  # cerfified builds of OpenJDK
    python3Minimal

    # COMMAND LINE TOOLS
    rclone
    git
    tig
    diff-so-fancy
    poppler-utils
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
    cloc      # code counter
    scc       # accurate code counter with complexity calculations
    plantuml  # UML diagrams as code
    ltrace    # library call monitoring
    strace    # system call monitoring
    fzf       # command-line fuzzy finder
    ripgrep   # recursively searches directories for a regex pattern
    bat
    broot
    tree
    eza     # a modern replacement for ls
    lsof    # list open files
    ncdu
    dust
    jq    # a lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    tealdeer
    fastfetch
    hyperfine   # command-line benchmarking tool
    nmon    # system and process monitor
    htop
    atop
    iotop # io monitoring
    iftop # network monitoring
    curl
    wget
  ];
}
