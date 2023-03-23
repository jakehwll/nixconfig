# nixconfig

A Nix/NixOS configured to my use-case.

> **Note**:
> This configuration is forked from [dlip/nixconfig-starter](https://github.com/dlip/nixconfig-starter) and configured to my use-case. 

## Getting Started

### ❄️ NixOS


- Download the [ISO](https://nixos.org/download.html#nixos-iso) and write it to a flash drive
- Install using the GUI installer or terminal
  ```sh
  nix-shell -p git
  git clone https://github.com/jakehwll/nixconfig.git
  cd nixconfig
  # you can use either `wnxr-nix` or `wnxr-work` below.
  cp /etc/nixos/*.nix systems/wnxr-nix
  ```
- Modify the `flake.nix` where it says "CHANGE ME" to the user you set up on installation
- You can remove user specific packages since we are managing them using home-manager.
  ```nix
  # /systems/wnxr-nix/configuration.nix
  packages = with pkgs; [
  # firefox
  # kate
  # thunderbird
  ];
  ```
- ```sh
  # pick between either `wnxr-nix` or `wnxr-work` below.
  sudo nixos-rebuild boot --flake .#wnxr-nix
  sudo reboot
  ```

### 🐳 Docker

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

## Adding software

- You can search for software from this site: https://search.nixos.org/. The name of the package is the red text next to `Name` in the results
- Add the package to `home.packages` in `home/default.nix` or `home/graphical.nix` if it is GUI software
- Then run:
  ```
  sudo nixos-rebuild switch --flake .#nixos
  ```

## Upgrading

- Updates are manual, so set a calander event every Friday etc. to update your system
- All software, including the OS is locked to the nixpkgs git version in `flake.lock`, to update this run:
  ```sh
  nix flake update
  ```

- Then run this to apply and reboot
  ```sh
  sudo nixos-rebuild boot --flake .#nixos
  sudo reboot
  ```

- Once you are confident everything is working, you can remove old generations with
  ```sh
  sudo nix-collect-garbage -d
  ```

# DisplayLink

There may be requirements for a "Display Link" device in certain configurations.

You can download the latest driver [here](https://www.synaptics.com/products/displaylink-graphics/downloads/ubuntu).