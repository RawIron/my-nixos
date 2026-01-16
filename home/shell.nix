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
    timg
    glow
    ffmpegthumbnailer
    epub-thumbnailer
    universal-ctags
    cloc
    scc
    eza
    dust
    tealdeer
    atop
    btop
    iotop
    bottom
  ];

}
