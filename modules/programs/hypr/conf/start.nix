{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.myopt.waybar.enable {
    home-manager.users.${config.myopt.username} = {
      wayland.windowManager.hyprland.enable = true;
      wayland.windowManager.hyprland.settings = {
        exec-once = ["pkill waybar;waybar &; kitty; hyprpaper"];
      };
    };
  };
}
