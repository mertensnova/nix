
{
  description = "Nyx using NixOS";

  outputs = { self, nixpkgs,... }@inputs: {

    nixosConfigurations = import ./hosts {inherit nixpkgs inputs self;};
 
  };
  inputs = {

        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        waybar.url = "github:Alexays/Waybar";
    hyprlock = {
            url = "github:hyprwm/hyprlock";
            inputs.nixpkgs.follows = "nixpkgs";
        };

     home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
 };



}

