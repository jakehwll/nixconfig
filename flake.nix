{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, ... }:
    let
      users = {
        me = {
          name = "Jake Howell";
          username = "wnxr";
          homeDirectory = "/home/wnxr";
          email = "jake@hwll.me";
        };
        docker = {
          name = "Docker User";
          username = "root";
          homeDirectory = "/root";
          email = "docker@example.com";
        };
      };
      pkgsForSystem = { system }: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      homeConfigurations = {
        docker = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsForSystem { system = "x86_64-linux"; };
          modules = [
            ./home
          ];
          extraSpecialArgs = {
            user = users.docker;
          };
        };
      };
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          pkgs = pkgsForSystem { system = "x86_64-linux"; };
          modules = [
            ./systems/nixos/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                # CHANGE 'jdoe' TO YOUR USERNAME
                users.jdoe = {
                  imports = [
                    ./home
                    ./home/graphical.nix
                  ];
                };

                extraSpecialArgs = {
                  user = users.me;
                };
              };
            }
          ];
        };
      };
    };
}
