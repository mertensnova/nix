{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.myopt.hyprland.enable {
    home-manager.users.${config.myopt.username} = {
      wayland.windowManager.hyprland.settings = {
        exec-once = ["waybar; kitty; hyprpaper"];
        monitor = ",preferred,auto,auto";
        env = [
          "QT_QPA_PLATFORMTHEME,qt5ct"
          "XCURSOR_SIZE,24"
        ];

        input = {
          kb_layout = "us";
          follow_mouse = 1;
          force_no_accel = true;
          natural_scroll = false;
        };

        gestures = {
          workspace_swipe = true;
          workspace_swipe_invert = true;
        };

        general = {
          gaps_in = 5;
          gaps_out = 5;
          border_size = 0;
          "col.active_border" = lib.mkForce "rgb(262626)";
          "col.inactive_border" = lib.mkForce "rgb(202020)";
          no_border_on_floating = false;
          layout = "master";
        };

        decoration = {
          rounding = 0;
          shadow_ignore_window = true;
          drop_shadow = true;
          shadow_range = 4;
          shadow_render_power = 2;
          "col.shadow" = lib.mkForce "0x66000000";
        };
        dwindle = {
          no_gaps_when_only = false;
          pseudotile = true;
          preserve_split = true;
        };

        master = {
          mfact = 0.5;
          special_scale_factor = 0.8;
          no_gaps_when_only = false;
          orientation = "right";
          new_status = "master";
        };

        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
        };
        animations = {
          enabled = true;
          bezier = [
            "pace,0.46, 1, 0.29, 0.99"
            "overshot,0.13,0.99,0.29,1.1"
            "md3_decel, 0.05, 0.7, 0.1, 1"
            "smoothOut, 0.36, 0, 0.66, -0.56"
            "smoothIn, 0.25, 1, 0.5, 1"
          ];
          animation = [
            "windows, 1, 5, overshot, slide"
            "windowsOut, 1, 4, smoothOut, slide"
            "windowsMove, 1, 4, default"
            "border, 1, 10, default"
            "workspaces,1,9,md3_decel,slide"
            "workspaces, 1, 6, default"
            "specialWorkspace,1,8,md3_decel,slide"
            "fade, 1, 10, smoothIn"
            "fadeDim, 1, 10, smoothIn"
          ];
        };
        misc.force_default_wallpaper = -1;
      };
    };
  };
}
