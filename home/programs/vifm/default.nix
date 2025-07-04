{ ... }:

{
  # link the configuration file in current directory
  # to the specified location in home directory
  home.file.".config/vifm/vifmrc".source = ./vifmrc;
  home.file.".config/vifm/colors/onedark.vifm".source = ./onedark.vifm;
  home.file.".config/vifm/scripts/ffprobe_jq.sh".source = ./ffprobe_jq.sh;
}
