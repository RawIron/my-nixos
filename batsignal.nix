{
  pkgs,
  config,
  ...
}:
with pkgs;
with config;

{
  services = {
    batsignal = {
      enable = true;
      extraArgs = [
        "-w 25"
        "-c 20"
      ];
    };
  };
}
