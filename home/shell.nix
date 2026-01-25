let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    helix
    zellij
    joshuto
    rxvt-unicode-unwrapped
    tig
    diff-so-fancy
    lazygit
    yazi
    timg
    glow
    ffmpegthumbnailer
    epub-thumbnailer
    universal-ctags
    cloc
    tokei
    scc
    eza     # replacement for ls
    zoxide  # cd with ranking algorithm to navigate frequently used directories
    dust
    tealdeer
    atop
    btop
    bottom
    iotop
  ];

}
