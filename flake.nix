{
  description = "snow flake :3";
  inputs = {
    
    # pull pkgs from Unstable branch
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # enable home manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {

    nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix # import main config file

	  # home manager settings
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useUserPackages = true;
              useGlobalPkgs = true;
              backupFileExtension = "backup";
              users.aryu = import ./home.nix;
            };
          }

	  # allow unfree software
      	 { nixpkgs.config.allowUnfree = true; }
      ];
    };
  };
}
