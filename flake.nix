{
    description = "System configuration flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager/master";
            inputs.nixpkgs.follows = "nixpkgs";
          };
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs:
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
