{ ... }:

{
  programs = {
    # simple alternative to 'find'
    fd = {
      enable = true;
      hidden = true;
      ignores = [
      ".git"
      ".mozilla"
      ".cache"
      "Calibre Library"
      ".nix-defexpr"
      ".config/Signal"
      ".local/state/home-manager"
      ];
    };
  };
}
