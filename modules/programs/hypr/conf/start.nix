{pkgs, ...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = ["pkill waybar;waybar &; kitty; hyprpaper"];
  };
}
