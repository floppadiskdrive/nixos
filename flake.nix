{
  description = "Floppa flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.FlopPadT480 = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
	./configuration.nix
	./noctalia.nix
	home-manager.nixosModules.home-manager
	{
		home-manager = {
			useGlobalPkgs = true;
			useUserPackages = true;
			users.floppadisk = import ./home.nix;
			backupFileExtension = "backup";
		};
	}

      ];
    };
  };
}
