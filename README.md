# Sway on NixOS

### login screen
* greetd

### app launcher
* rofi

### status bar
* i3status

### notifications
* mako
* batsignal

### file browser
* vifm

### mount usb

### partition disk, format drive

### disk usage

### network connections
* nmcli

### vpn

### power savings

### wallpaper
* bg

### shutdown, restart, hibernate
* rofi

### screen lock, logout

### screen brightness

### audio volume, media control


## Install NixOS

Download most recent NixOS release.
```
wget https://channels.nixos.org/nixos-24.11/latest-nixos-gnome-x86_64-linux.iso
```

Create a bootable USB stick.
For more details see [NixOS Install Documentation][nixos-usb] or the blog post [How to Create a Bootable USB from ISO using DD][usb-with-dd].
```
sudo dd if=~/Downloads/latest-nixos-gnome-x86_64-linux.iso of=/dev/sdX bs=4M status=progress oflag=sync
```

Install NixOS from bootable USB
* Check / Change boot priority in BIOS
* Restart


## Configure NixOS

Clone this github repo
```
git clone git@github.com:RawIron/my-nixos.git
```

Copy or Symlink the repo folder to /etc/nixos
```
sudo rclone copy my-nixos /etc/nixos
```

Rebuild NixOS
```
cd /etc/nixos
sudo nixos-rebuild switch --flake .
```

[nixos-usb]: https://nixos.org/manual/nixos/stable/#sec-booting-from-usb-linux
[usb-with-dd]: https://pendrivelinux.com/create-bootable-usb-from-iso-using-dd/
