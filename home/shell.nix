let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    helix
    tig
    diff-so-fancy
    zellij
    rxvt-unicode-unwrapped
    joshuto
    timg
    glow
    ffmpegthumbnailer
    epub-thumbnailer
    universal-ctags
    cloc
    scc
    eza
    lsof
    ncdu
    dust
    tealdeer
    nmon
    htop
    atop
    btop
    iotop
    bottom
  ];

}
