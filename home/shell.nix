let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    helix
    zellij
    joshuto
    lazygit
    yazi  # terminal file manager
    tokei   # count lines of source code
            # color‑coded output, supports ignore
    eza     # replacement for ls
    zoxide  # cd with ranking algorithm to navigate frequently used directories
    xxd   # hexdump from a binary file, or vice-versa
    file
    btop    # system and process monitor
    bottom  # system and process monitor
  ];

}
