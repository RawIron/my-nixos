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
    i3status = {
      enable = true;
      general = {
        output_format = "i3bar";
        colors = true;
        color_good = "${color.h_bright_green}";
        color_degraded = "${color.h_bright_yellow}";
        color_bad = "${color.h_bright_red}";
        interval = 5;
      };
      modules = {
        "wireless _first_" = {
          position = 1;
          settings = {
            format_up = "W: %quality %essid";
            format_down = "W: down";
          };
        };
        "load" = {
          position = 3;
          settings = {
            format = "L: %1min";
            max_threshold = 5;
          };
        };
        "battery all" = {
          position = 4;
          settings = {
            format = "%status %percentage";
            threshold_type = "percentage";
            low_threshold = 15;
          };
        };
        "disk /" = {
          position = 5;
          settings = {
            format = "/ %avail";
            threshold_type = "gbytes_avail";
            low_threshold = 15;
          };
        };
        "memory" = {
          position = 6;
          settings = {
            format = "M: %used";
            format_degraded = "M< %available";
            threshold_degraded = "2G";
            threshold_critical = "1G";
          };
        };
      };
    };
  };
}
