{
  lib,
  pkgs,
  ...
}:
with lib;
with pkgs;

let
  mod4 = "Mod4";
  opacity = "0.85";

  # Navigation
  left = "h";
  down = "j";
  up = "k";
  right = "l";

  color = import ./color.nix {};
  theme = import ./theme.nix {};

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
      modifier = "${mod4}";
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
          bg = "~/.local/share/backgrounds/2025-03-20-19-39-52-1338171.png fill";
        };
      };
      fonts = {
        names = ["${theme.font}"];
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
          names = [ "monospace" ];
          size = 8.0;
        };
        colors = {
          background = "#31363b20";
          statusline = "#ffffff";
          separator = "#666666";
          focusedWorkspace = {
            background = "#4c7899";
            border = "#285577";
            text = "#ffffff";
          };
          activeWorkspace = {
            background = "#333333";
            border = "#5f676a";
            text = "#ffffff";
          };
          inactiveWorkspace = {
            background = "#333333";
            border = "#222222";
            text = "#888888";
          };
          urgentWorkspace = {
            background = "#2f343a";
            border = "#900000";
            text = "#ffffff";
          };
          bindingMode = {
            background = "#2f343a";
            border = "#900000";
            text = "#ffffff";
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
        {
          command = "opacity ${opacity}, border pixel 3, inhibit_idle fullscreen";
          criteria = {
            class = ".*";
          };
        }
        {
          command = "opacity ${opacity}, border pixel 3, inhibit_idle fullscreen";
          criteria = {
            app_id = ".*";
          };
        }];
      };
      assigns = {
        "1" = [ # Terminal
          { app_id = "foot"; }
          { app_id = "st"; }
        ];
        "2" = [ # Browser
          { app_id = "firefox"; }
        ];
        "3" = [ # Communicating
          { class = "signal.*"; }
        ];
        "4" = [ # Editor
          { app_id = "vscode"; }
        ];
      };
      floating = {
        modifier = "${mod4}";
        border = 3;
        titlebar = false;
        criteria = [
          { app_id = ".*zathura"; }
          { app_id = "imv"; }
          { app_id = "mpv"; }
          { app_id = "qt5ct"; }
          { app_id = "qt6ct"; }
          { class = "Zotero"; }
          { instance = "lxappearance"; }
        ];
      };
    };
  };

  wayland.windowManager.sway = {
    config = {
      keybindings = mkOptionDefault {
        # Rofi: menu
        "${mod4}+d" = "exec ${rofi}/bin/rofi -show drun";
        # Rofi: clipboard manager
        "${mod4}+c" = "exec ${cliphist}/bin/cliphist list | ${rofi}/bin/rofi -dmenu | ${cliphist}/bin/cliphist decode | ${wl-clipboard}/bin/wl-copy";
        # Rofi: password store
        "${mod4}+e" = "exec ${rofi-pass-wayland}/bin/rofi-pass";
        # Rofi: power menu
        "${mod4}+x" = "exec ${rofi}/bin/rofi -show menu -modi 'menu:${rofi-power-menu}/bin/rofi-power-menu --no-symbols'";
        # Rofi: filebrowser
        "${mod4}+g" = "exec ${rofi}/bin/rofi -show filebrowser";

        # Terminal
        "${mod4}+Return" = "exec ${kitty}/bin/kitty";

        # Modes
        "${mod4}+r" = "mode resize";
        "${mod4}+u" = "mode audio";
        "Print" = "mode printscreen";
        "Shift+Print" = "mode recording";

        "${mod4}+Tab" = "workspace next";
        "${mod4}+Shift+Tab" = "workspace prev";

        "${mod4}+1" = "workspace number 1";
        "${mod4}+2" = "workspace number 2";
        "${mod4}+3" = "workspace number 3";
        "${mod4}+4" = "workspace number 4";
        "${mod4}+5" = "workspace number 5";
        "${mod4}+6" = "workspace number 6";
        "${mod4}+7" = "workspace number 7";
        "${mod4}+8" = "workspace number 8";
        "${mod4}+9" = "workspace number 9";

        "${mod4}+${left}" = "focus left";
        "${mod4}+${right}" = "focus right";
        "${mod4}+${down}" = "focus down";
        "${mod4}+${up}" = "focus up";

        "${mod4}+Shift+${left}" = "move left";
        "${mod4}+Shift+${right}" = "move right";
        "${mod4}+Shift+${down}" = "move down";
        "${mod4}+Shift+${up}" = "move up";
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
          # Audio = "launch: [i]input [o]output";
          Escape = "mode default";
          Return = "mode default";
          "i" = "exec ${rofi-pulse-select}/bin/rofi-pulse-select source, mode default";
          "o" = "exec ${rofi-pulse-select}/bin/rofi-pulse-select sink, mode default";
        };
        resize = {
          Escape = "mode default";
          Return = "mode default";
          "${down}" = "resize grow height 5 px or 5 ppt";
          "${left}" = "resize shrink width 5 px or 5 ppt";
          "${right}" = "resize grow width 5 px or 5 ppt";
          "${up}" = "resize shrink height 5 px or 5 ppt";
        };
        session = {
          # Session = launch:
          # [h]ibernate [p]oweroff [r]eboot
          # [s]uspend [l]ockscreen log[o]ut
          Escape = "mode default";
          Return = "mode default";
          "h" = "exec ${systemd}/bin/systemctl hibernate, mode default";
          "p" = "exec ${systemd}/bin/systemctl poweroff, mode default";
          "r" = "exec ${systemd}/bin/systemctl reboot, mode default";
          "s" = "exec ${systemd}/bin/systemctl suspend, mode default";
          "l" = "exec ${swaylock}/bin/swaylock, mode default";
          "o" = "exec ${sway}/bin/swaymsg exit, mode default";
        };
      };
    };
  };
}
