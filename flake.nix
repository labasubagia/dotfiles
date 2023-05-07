{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    inherit (self) outputs;

    forEachSystem = nixpkgs.lib.genAttrs [ "x86_64-linux" ];
    forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});

    mkNixos = modules: system: nixpkgs.lib.nixosSystem {
      inherit modules system;
      specialArgs = { inherit inputs outputs; };
    };

    mkHome = modules: pkgs: user: home-manager.lib.homeManagerConfiguration {
      inherit modules pkgs;
      extraSpecialArgs = { inherit inputs outputs user; };
    };

  in {
    devShells = forEachPkgs (pkgs: import ./shell.nix { inherit pkgs; });
    formatter = forEachPkgs (pkgs: pkgs.nixpkgs-fmt);

    nixosConfigurations = {
      vbox = mkNixos [ ./hosts/vbox ] "x86_64-linux";
    };

    homeConfigurations = {
      "demo@vbox" = mkHome [ ./home/vbox.nix ] nixpkgs.legacyPackages."x86_64-linux" "demo";
    };
  };
}
