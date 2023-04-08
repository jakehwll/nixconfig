{ config, pkgs, user, ... }:
{
  imports = [
    ./git.nix
    ./bash.nix
    ./zsh.nix
    ./nvim.nix
  ];

  home.username = user.username;
  home.homeDirectory = user.homeDirectory;
  home.stateVersion = "22.05";
  programs.home-manager.enable = true;
  programs.direnv.enable = true;

  home.packages = with pkgs; [
    wget
    tailscale
    bitwarden-cli
    lastpass-cli
    docker
    docker-compose
    docker-buildx
    nodePackages.npm
    awscli2
    htop
    appimage-run
    unzip
    zip
    oh-my-zsh
    nodejs
    stripe-cli
    kubectl
    wally-cli
    yarn
    # libreoffice
  ];
}
