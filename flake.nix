{
  description = "Nyx using NixOS";
  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations = import ./hosts {
      inherit nixpkgs inputs self;
    };
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix/ed91a20c84a80a525780dcb5ea3387dddf6cd2de";
    #stylix.url = "github:danth/stylix";
    waybar.url = "github:Alexays/Waybar";
    base16.url = "github:SenchoPens/base16.nix";
    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
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
