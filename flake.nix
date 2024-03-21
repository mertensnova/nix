{
  description = "Nyx using NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
 waybar.url = "github:Alexays/Waybar";
  hyprlock = {
            url = "github:hyprwm/hyprlock";
            inputs.nixpkgs.follows = "nixpkgs";
        };

  };

  outputs = { self, nixpkgs,... }@inputs: {

 nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
 system = "x86_64-linux";   
   specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
        # inputs.home-manager.nixosModules.default
      ];
    };
  };
}
