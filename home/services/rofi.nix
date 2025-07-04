{
  pkgs,
  config,
  ...
}:
with pkgs;
with config;

let
  color = import ../color.nix {};
  theme = import ../theme.nix {};
in
{
  programs = {
    rofi = {
      enable = true;
      font = "${theme.font} ${toString theme.font-size}";
      package = rofi-wayland;
      extraConfig = {
        case-sensitive = false;
        display-drun = "Apps:";
        modi = [
          "drun"
          "filebrowser"
          "run"
        ];
        show-icons = false;
      };
      plugins = [
        rofi-file-browser
        rofi-pulse-select
        rofi-systemd
      ];
      theme = let
        # Use `mkLiteral` for string-like values
        # that should show without quotes
        mkLiteral = config.lib.formats.rasi.mkLiteral;
      in {
        "*" = {
          bg = mkLiteral color.h_background ;
          fg = mkLiteral color.h_foreground;
          ac = mkLiteral color.h_bright_blue;
          background-color = mkLiteral "transparent";
        };

        "#window" = {
          transparency = "real";
          background-color = mkLiteral color.r_transparentBackground;
          location = mkLiteral "center";
          width = mkLiteral "30%";
        };

        "#prompt" = {
          text-color = mkLiteral "@fg";
        };

        "#textbox-prompt-colon" = {
          text-color = mkLiteral "@fg";
        };

        "#entry" = {
          text-color = mkLiteral "@fg";
          blink = mkLiteral "true";
        };

        "#inputbar" = {
          children = mkLiteral "[ prompt, entry ]";
          text-color = mkLiteral "@fg";
          padding = mkLiteral "5px";
        };

        "#listview" = {
          columns = mkLiteral "1";
          lines = mkLiteral "6";
          cycle = mkLiteral "true";
          dynamic = mkLiteral "true";
        };

        "#mainbox" = {
          border = mkLiteral "3px";
          border-color = mkLiteral "@ac";
          children = mkLiteral "[ inputbar, listview ]";
          padding = mkLiteral "10px";
        };

        "#element" = {
          text-color = mkLiteral "@fg";
          padding = mkLiteral "5px";
        };

        "#element-icon" = {
          text-color = mkLiteral "@fg";
          size = mkLiteral "32px";
        };

        "#element-text" = {
          text-color = mkLiteral "@fg";
          padding = mkLiteral "5px";
        };

        "#element selected" = {
          border = mkLiteral "3px";
          border-color = mkLiteral "@ac";
          text-color = mkLiteral "@fg";
          background-color = mkLiteral "@ac";
        };
      };
    };
  };
}
