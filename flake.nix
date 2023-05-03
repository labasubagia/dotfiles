{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: 
  let
    user = "demo"; 
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      "${user}" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users."${user}" = import ./home-manager/home.nix;
            home-manager.extraSpecialArgs = {
              inherit inputs;
              inherit user;
            };
          }
        ];
      };
    };
  };
}