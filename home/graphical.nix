{ config, pkgs, user, ... }:
{
  imports = [
    ./fonts.nix
    ./vscode.nix
  ];
  home.packages = with pkgs; [
    dbeaver
    firefox
    google-chrome
    lens
    spotify
    bitwarden
    vscode
    postman
    slack
    discord
    tdesktop
    teams
    transgui
    openrgb
    vlc
    gnome3.gnome-tweaks
  ];
}
