{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {

    monitor = ",preferred,auto,auto";
    env = [
      "QT_QPA_PLATFORMTHEME,qt5ct"
      "XCURSOR_SIZE,24"
    ];

    input = {
      kb_layout = "pt";
      follow_mouse = 1;
      force_no_accel = true;
      natural_scroll = false;
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_invert = true;
    };

    general = {
      gaps_in = 2;
      gaps_out = 5;
      border_size = 1;
      layout = "dwindle";
      allow_tearing = false;
    };

    dwindle = {
      preserve_split = true;
      pseudotile = true;
    };

    master = {
      new_is_master = false;
    };

    animations = {

      enabled = true;
 bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

    animation = [
"myBezier, 0.05, 0.9, 0.1, 1.05"
       "windows, 1, 7, myBezier"
       "windowsOut, 1, 7, default, popin 80%"
       "border, 1, 10, default"
       "borderangle, 1, 8, default"
       "fade, 1, 7, default"
      "workspaces, 1, 6, default"
];
    };

    decoration = {
      rounding = 3;
      blur.enabled = true;
      blur.size = 3;
      blur.passes = 1;
      blur.vibrancy = 0.1696;

      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;
      "col.shadow" = "rgba(1a1a1aee)";
    };

    misc.force_default_wallpaper = -1;

  };
}


