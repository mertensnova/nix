{
  description = "Nyx using NixOS";

  outputs = {
    self,
    nixpkgs,
    stylix,
    ...
  } @ inputs: {
    nixosConfigurations = import ./hosts {inherit nixpkgs inputs self stylix;};
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    waybar.url = "github:Alexays/Waybar";
    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zed-editor = {
      url = "github:zed-industries/zed";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
