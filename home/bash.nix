{ config, pkgs, lib, ... }:
{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      [ -f $HOME/.nix-profile/etc/profile.d/nix.sh ] && source $HOME/.nix-profile/etc/profile.d/nix.sh
      export EDITOR=code
    '';
  };
}
