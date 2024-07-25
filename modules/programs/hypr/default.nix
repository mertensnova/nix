{
  inputs,
  config,
  ...
}: {
  programs.hyprland.enable = true;
  home-manager.users.${config.myopt.username} = {
    imports = [
      ./hyprlock.nix
      ./conf/binds.nix
      ./conf/settings.nix
      ./conf/start.nix
    ];
    wayland.windowManager.hyprland.enable = true;
  };
}
