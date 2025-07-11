{ config, pkgs, ... }:

let
  theme = import ./theme.nix {};
in
{
  imports = [
    ./services
    ./programs
  ];

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
    GTK_THEME = "${theme.theme}";

    # Java AWT applications
    _JAVA_AWT_WM_NONREPARENTING=1;
  };
}
