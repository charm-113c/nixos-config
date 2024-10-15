{
    description = "System configuration flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager/master";
            inputs.nixpkgs.follows = "nixpkgs";
          };
        
        hyprland.url = "github:hyprwm/Hyprland";
        hyprland-plugins = {
            url = "github:hyprwm/hyprland-plugins";
            inputs.hyprland.follows = "hyprland";
          };
    };

    outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs:
      let
        lib = nixpkgs.lib;
      in {
        nixosConfigurations = {
            # nixos is hostname, can be whatever, provided you then give .#<hostname> as argument to rebuild --flake
            nixos = lib.nixosSystem {
                system = "x86_64-linux";

                # Make inputs params available as dependencies to all submodules (e.g. configuration.nix)
                # (do not forget to add `inputs` to initial params of submodules to do so)
                specialArgs = { inherit inputs; };

                modules = [ 
                  ./configuration.nix
                  # hyprland.nixosModules.default
                  home-manager.nixosModules.home-manager {
                      home-manager.useGlobalPkgs = true;
                      home-manager.useUserPackages = true;
                      home-manager.users.charm = import ./home.nix;
                    }
                ];
              };
          };
      };
  }
