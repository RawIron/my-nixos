## Install NixOS

Download most recent NixOS release from
```
wget 
```

Create a bootable USB stick
```
sudo dd if=~/Downloads/nixos-x86_64-24.11.iso of=/dev/sdb bs=4M status=progress oflag=sync
```

Install NixOS from bootable USB
* Check / Change boot priority in BIOS
* Restart


## Configure NixOS

Clone this github repo
```
git clone 
```

Copy or Symlink the repo folder to /etc/nixos
```
rclone copy my-nixos /etc/nixos
```

Rebuild NixOS
```
cd /etc/nixos
sudo nixos-rebuild switch --flake .
```

