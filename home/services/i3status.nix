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
        "ipv6" = {
          position = 0;
        };
        "path_exists VPN" = {
          position = 1;
          settings = {
            # a VPN tunnel launched by proton is active
            path = "/proc/sys/net/ipv4/conf/proton0";
            format = "%title";
            format_down = "";
          };
        };
        "wireless _first_" = {
          position = 2;
          settings = {
            format_up = "W: %quality %essid";
            format_down = "W: down";
          };
        };
        "ethernet _first_" = {
          position = 3;
          settings = {
            format_up = "E: %speed";
            format_down = "E: down";
          };
        };
        "load" = {
          position = 4;
          settings = {
            format = "L: %1min";
            max_threshold = 5;
          };
        };
        "battery all" = {
          position = 5;
          settings = {
            format = "%status %percentage";
            threshold_type = "percentage";
            low_threshold = 15;
          };
        };
        "disk /" = {
          position = 6;
          settings = {
            format = "/ %avail";
            threshold_type = "gbytes_avail";
            low_threshold = 15;
          };
        };
        "memory" = {
          position = 7;
          settings = {
            format = "M: %used";
            format_degraded = "M< %available";
            threshold_degraded = "2G";
            threshold_critical = "1G";
          };
        };
        "tztime local" = {
          position = 8;
          settings = {
            format = "%Y-%m-%d %H:%M:%S";
          };
        };
      };
    };
  };
}
