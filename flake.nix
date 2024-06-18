{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, sops-nix, ... }@inputs:
    let
      inherit (self) outputs;

      forEachSystem = nixpkgs.lib.genAttrs [ "x86_64-linux" ];
      forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});

      mkNixos = config: system: nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          config
          sops-nix.nixosModules.sops
        ];
        specialArgs = { inherit inputs outputs; };
      };

      mkHome = config: pkgs: user: home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          config
          sops-nix.homeManagerModules.sops
        ];
        extraSpecialArgs = { inherit inputs outputs user; };
      };

    in
    {
      devShells = forEachPkgs (pkgs: import ./shell.nix { inherit pkgs; });
      formatter = forEachPkgs (pkgs: pkgs.nixpkgs-fmt);

      nixosConfigurations = {
        vbox = mkNixos ./hosts/vbox "x86_64-linux";

        # Acer Aspire E5-553G 114Q (personal)
        sloth = mkNixos ./hosts/sloth "x86_64-linux";

        # Dell Vostro 14 3000 (office)
        eagle = mkNixos ./hosts/eagle "x86_64-linux";
      };

      homeConfigurations = {
        # virtualbox demo ova
        "demo@vbox" = mkHome ./home/vbox.nix nixpkgs.legacyPackages."x86_64-linux" "demo";

        # default user for WSL
        "user@wsl" = mkHome ./home/user-wsl.nix nixpkgs.legacyPackages."x86_64-linux" "user";

        # default user for device/GUI
        "user" = mkHome ./home/user.nix nixpkgs.legacyPackages."x86_64-linux" "user";
      };
    };
}
