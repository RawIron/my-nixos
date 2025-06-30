{
  lib,
  pkgs,
  ...
}:
with lib;
with pkgs;

let
  mod = "Mod4";
  wallpaper = "~/.local/share/backgrounds/current.png";

  # Navigation
  left = "h";
  down = "j";
  up = "k";
  right = "l";

  color = import ./color.nix {};
  theme = import ./theme.nix {};

  opacity = color.opacity;

  window_bg_color = color.h_background;
  view_bg_color = color.h_bright_black;
  view_fg_color = color.h_foreground;
  accent_bg_color = color.h_bright_blue;
  accent_fg_color = color.h_foreground;
  urgent_bg_color = color.h_bright_red;
  urgent_fg_color = color.h_foreground;
in
{
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;  # see config.output
  };

  wayland.windowManager.sway = {
    config = {
      modifier = "${mod}";
      focus = {
        forceWrapping = false;
        followMouse = false;
      };
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
      output = {
        # this only works with checkConfig = false
        # https://www.reddit.com/r/NixOS/comments/1c9n1qk/nixosrebuild_of_sway_failing_with_unable_to/
        "*" = {
          bg = "${wallpaper} fill";
        };
      };
      fonts = {
        names = [ "${theme.font}" ];
        size = toString theme.font-size;
      };
      gaps = {
        inner = 15;
      };
    };
  };

  wayland.windowManager.sway = {
    config = {
      bars = [{
        #command = "${i3bar}/bin/i3bar";
        statusCommand = "${i3status}/bin/i3status";
        position = "bottom";
        mode = "dock";
        hiddenState = "hide";
        workspaceButtons = true;
        workspaceNumbers = true;
        trayOutput = "primary";
        fonts = {
          names = [ "${theme.font-mono}" ];
          size = toString theme.font-size-small;
        };
        colors = {
          background = "${color.h_transparentBackground}";
          statusline = "${color.h_bright_green}";
          separator = "${color.h_bright_black}";
          focusedWorkspace = {
            background = "${color.h_background}";
            border = "${color.h_blue}";
            text = "${color.h_blue}";
          };
          activeWorkspace = {
            background = "${color.h_background}";
            border = "${color.h_bright_green}";
            text = "${color.h_bright_green}";
          };
          inactiveWorkspace = {
            background = "${color.h_background}";
            border = "${color.h_bright_black}";
            text = "${color.h_bright_black}";
          };
          urgentWorkspace = {
            background = "${color.h_background}";
            border = "${color.h_red}";
            text = "${color.h_red}";
          };
          bindingMode = {
            background = "${color.h_background}";
            border = "${color.h_red}";
            text = "${color.h_white}";
          };
        };
      }];
    };
  };

  wayland.windowManager.sway = {
    config = {
      window = {
        border = 3;
        titlebar = false;
        commands = [
        # the following syntax is not supported:
        # criteria = [ { app_id = "feh"; } { app_id = "imv"; } ];
        {
          command = "opacity ${opacity}, border pixel 3, inhibit_idle fullscreen";
          criteria = { class = ".*"; };
        }
        {
          command = "opacity ${opacity}, border pixel 3, inhibit_idle fullscreen";
          criteria = { app_id = ".*"; };
        }
        {
          command = "opacity 1.00, border pixel 3, inhibit_idle fullscreen";
          criteria = { app_id = "mpv"; };
        }
        {
          command = "opacity 1.00, border pixel 3, inhibit_idle fullscreen";
          criteria = { class = "feh"; };
        }
        {
          command = "opacity 1.00, border pixel 3, inhibit_idle fullscreen";
          criteria = { app_id = "imv"; };
        }
        ];
      };
      assigns = {
        "1" = [ # Terminal
          { app_id = "foot"; }
          { app_id = "st"; }
        ];
        "2" = [ # Browser
          { app_id = "firefox"; }
        ];
        "3" = [ # Communication
          { class = "signal.*"; }
        ];
        "4" = [ # Editor
          { app_id = "vscode"; }
        ];
        "5" = [ # System Monitor
          { app_id = "htop"; }
        ];
      };
      floating = {
        modifier = "${mod}";
        border = 3;
        titlebar = false;
        criteria = [
          { app_id = ".*zathura"; }
          { app_id = "imv"; }
          { app_id = "mpv"; }
          { app_id = "qt5ct"; }
          { app_id = "qt6ct"; }
          { class = "feh"; }
          { class = "Zotero"; }
          { instance = "lxappearance"; }
        ];
      };
    };
  };

  wayland.windowManager.sway = {
    config = {
      # Custom
      keybindings = mkOptionDefault {
        # Rofi: menu
        "${mod}+d" = "exec ${rofi}/bin/rofi -show drun";
        # Rofi: clipboard manager
        "${mod}+Ctrl+c" = "exec ${cliphist}/bin/cliphist list | ${rofi}/bin/rofi -dmenu | ${cliphist}/bin/cliphist decode | ${wl-clipboard}/bin/wl-copy";
        # Rofi: password store
        "${mod}+Ctrl+i" = "exec ${rofi-pass-wayland}/bin/rofi-pass";
        # Rofi: power menu
        "${mod}+Ctrl+p" = "exec ${rofi}/bin/rofi -show menu -modi 'menu:${rofi-power-menu}/bin/rofi-power-menu --no-symbols'";
        # Rofi: filebrowser
        "${mod}+Ctrl+f" = "exec ${rofi}/bin/rofi -show filebrowser";

        # Terminal
        "${mod}+Return" = "exec ${foot}/bin/foot";

        # Modes
        "${mod}+m" = "mode audio";
        "${mod}+r" = "mode resize";
        "${mod}+Shift+p" = "mode session";
        "Print" = "mode printscreen";
        "Shift+Print" = "mode recording";

        "${mod}+Tab" = "workspace next";
        "${mod}+Shift+Tab" = "workspace prev";
      };
    };
  };

  wayland.windowManager.sway = {
    config = {
      colors = {
        background = window_bg_color;
        focused = {
          border = accent_bg_color;
          background = accent_bg_color;
          text = accent_fg_color;
          indicator = accent_bg_color;
          childBorder = accent_bg_color;
        };
        focusedInactive = {
          border = view_bg_color;
          background = view_bg_color;
          text = view_fg_color;
          indicator = view_bg_color;
          childBorder = view_bg_color;
        };
        unfocused = {
          border = view_bg_color;
          background = view_bg_color;
          text = view_fg_color;
          indicator = view_bg_color;
          childBorder = view_bg_color;
        };
        urgent = {
          border = urgent_bg_color;
          background = urgent_bg_color;
          text = urgent_fg_color;
          indicator = urgent_bg_color;
          childBorder = urgent_bg_color;
        };
        placeholder = {
          border = accent_bg_color;
          background = accent_bg_color;
          text = accent_fg_color;
          indicator = accent_bg_color;
          childBorder = accent_bg_color;
        };
      };
    };
  };

  wayland.windowManager.sway = {
    config = {
      modes = {
        audio = {
          # Audio
          # [i]nput [o]utput
          "i" = "exec ${rofi-pulse-select}/bin/rofi-pulse-select source, mode default";
          "o" = "exec ${rofi-pulse-select}/bin/rofi-pulse-select sink, mode default";
          Escape = "mode default";
          Return = "mode default";
        };
        resize = {
          "${down}" = "resize grow height 10 px or 10 ppt";
          "${left}" = "resize shrink width 10 px or 10 ppt";
          "${right}" = "resize grow width 10 px or 10 ppt";
          "${up}" = "resize shrink height 10 px or 10 ppt";
          Escape = "mode default";
          Return = "mode default";
        };
        session = {
          # Session
          # [p]oweroff [r]eboot
          # [h]ibernate [s]uspend
          # [l]ockscreen log[o]ut
          "h" = "exec ${systemd}/bin/systemctl hibernate, mode default";
          "p" = "exec ${systemd}/bin/systemctl poweroff, mode default";
          "r" = "exec ${systemd}/bin/systemctl reboot, mode default";
          "s" = "exec ${systemd}/bin/systemctl suspend, mode default";
          "l" = "exec ${swaylock}/bin/swaylock, mode default";
          "o" = "exec ${sway}/bin/swaymsg exit, mode default";
          Escape = "mode default";
          Return = "mode default";
        };
      };
    };
  };
}
