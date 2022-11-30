# nixconfig

A Nix/NixOS configured to my use-case.

> **Note**:
> This configuration is forked from [dlip/nixconfig-starter](https://github.com/dlip/nixconfig-starter) and configured to my use-case. 

## Getting Started

### NixOS

- Download the [ISO](https://nixos.org/download.html#nixos-iso) and write it to a flash drive
- Install using the GUI installer or terminal

```
nix-shell -p git
git clone https://github.com/jakehwll/nixconfig.git
cd nixconfig
cp /etc/nixos/*.nix systems/nixos
nano flake.nix
```

- Modify the `flake.nix` where it says "CHANGE ME" to the user you set up on installation
- Press ctrl+x to exit nano and select yes to save.

```
sudo nixos-rebuild boot --flake .#nixos
sudo reboot
```

### Docker

```
docker-compose run --name mynix nix bash
home-manager switch --flake .#docker
```

> **Note**:
> Be careful of running `docker system prune` while the container is stopped since it will delete it

To restart the container after a reboot run:

```
docker start -i mynix
```
