{
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./conf/binds.nix
    ./conf/settings.nix
  ];

  options.myopt = {
    hyprland.enable = lib.mkEnableOption "hyprland";
  };

  config = lib.mkIf config.myopt.hyprland.enable {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
        xdg-desktop-portal-hyprland
        xwaylandvideobridge
      ];
    };
    home-manager.users.${config.myopt.username} = {
      wayland.windowManager.hyprland = {
        enable = true;
      };
    };
  };
}
