{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.myopt.hyprland.enable {
    home-manager.users.${config.myopt.username} = {
      wayland.windowManager.hyprland.settings = {
        "$mainMod" = "SUPER";
        "$menu" = "tofi-drun --drun-launch=true";
        "$terminal" = "kitty";
        bindm = [
          "$mainMod,mouse:272,movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];
        bind = [
          "$mainMod, F , fullscreen"
          "$mainMod, RETURN, exec, $terminal"
          "$mainMod SHIFT, q, killactive"
          "$mainMod SHIFT, e, exit"
          "$mainMod, v, togglefloating"
          "$mainMod, d, exec, $menu"
          "$mainMod, p, pseudo"
          "$mainMod, g, togglesplit"
          "$mainMod SHIFT, x, exec, hyprlock"
          "$mainMod, l, movefocus, l"
          "$mainMod, h, movefocus, r"
          "$mainMod, k, movefocus, u"
          "$mainMod, j, movefocus, d"
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"
          "$mainMod SHIFT, 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, movetoworkspace, 9"
          "$mainMod SHIFT, 0, movetoworkspace, 10"
          "$mainMod, PRINT, exec, hyprshot -o ~/Pictures/Screenshots -m window"
          ", PRINT, exec, hyprshot -o ~/Pictures/Screenshots -m output"
          "$shiftMod, PRINT, exec, hyprshot -o ~/Pictures/Screenshots -m region"
          "$mainMod, S, togglespecialworkspace, magic"
          "$mainMod SHIFT, S, movetoworkspace, special:magic"
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"
          "$mainMod, mouse:272, movewindow"
          ",XF86AudioRaiseVolume, exec, pactl set-sink-volume 0 +5%"
          ",XF86AudioLowerVolume, exec, pactl set-sink-volume 0 -5%"
          ",XF86AudioMute, exec, pactl set-sink-mute 0 toggle"
          ", XF86MonBrightnessDown, exec, brightnessctl --min-val=2 -q set 5%-"
          ", XF86MonBrightnessUp, exec, brightnessctl -q set 5%+"
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPrev, exec, playerctl previous"
        ];
      };
    };
  };
}
