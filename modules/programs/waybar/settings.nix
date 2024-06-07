{ lib, config, ... }:
{
  config = lib.mkIf config.myopt.waybar.enable {
    home-manager.users.${config.myopt.username} = {
      programs.waybar.settings = [
        {
          position = "top";
          layer = "top";
          height = 35;
          margin-top = 10;
          margin-bottom = 0;
          margin-left = 5;
          margin-right = 5;

          modules-left = [
            "custom/icon"
            "custom/separator"
            "cpu"
            "memory"
            "temperature"
            "custom/separator"
            "custom/window-icon"
            "hyprland/window"
            "tray"
          ];

          modules-center = [ "hyprland/workspaces" ];

          modules-right = [
            "network"
            "backlight"
            "pulseaudio"
            "custom/right-arr"
            "battery"
            "clock"
          ];

          "hyprland/window" = {
            format = "<b>{}</b>";
            # exec = "hyprctl activewindow | grep class | awk '{print $2}'";
            separate-outputs = true;
            max-length = 35;
          };

          clock = {
            calendar = {
              format = {
                today = "<span color='#b4befe'><b>{}</b></span>";
              };
            };
            format = " {:%H:%M}";
            tooltip = "true";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format-alt = " {:%d/%m}";
          };
          "hyprland/workspaces" = {
            all-outputs = true;
            on-click = "activate";
            format = "{icon}";
            format-icons = {
              "1" = "ー";
              "2" = "二";
              "3" = "三";
              "4" = "四";
              "5" = "五";
              "6" = "六";
              "7" = "七";
              "8" = "八";
              "9" = "九";
              "10" = "〇";
              "default" = "一";
            };
          };

          memory = {
            format = " {}%";
            interval = 2;
          };

          cpu = {
            format = "  {usage}%";
            format-alt = "  {avg_frequency} GHz";
            interval = 2;
          };

          network = {
            format-wifi = " {bandwidthTotalBytes}";
            format-ethernet = "";
            tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
            format-linked = "{ifname} (No IP)";
            format-disconnected = "󰖪 ";
          };

          backlight = {
            format = "{icon} {percent}%";
            format-icons = [
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
            ];
            interval = 2;
          };

          "custom/right-arr" = {
            format = "  ";
          };

          battery = {
            format = "{icon} {capacity}%";
            format-alt = "{icon} {time}";
            format-charging = "󰚥 {capacity}%";
            format-icons = [
              " "
              " "
              " "
              " "
            ];

          };

          tray = {
            icon-size = 20;
            spacing = 8;
          };

          pulseaudio = {
            format = "{icon} <b>{volume}</b> {format_source}";
            format-source = "{volume}%  ";
            format-source-muted = "  ";
            format-bluetooth = " ᛒ <b>{volume}</b> ";
            format-bluetooth-muted = " ";
            format-muted = " {format_source}";
            format-icons = {
              default = [
                ""
                ""
                ""
              ];
            };
            scroll-step = 5;

          };

          temperature = {
            critical-threshold = 40;
            format = "{icon} {temperatureC}°C";
            format-critical = "{icon} {temperatureC}°C";
            format-icons = [
              ""
              ""
              ""
            ];
            interval = 2;
          };

          "custom/icon" = {
            format = "";

          };

          "custom/separtor" = {
            format = " ";
          };

          "custom/window-icon" = {
            # to be added
          };

        }

      ];

    };
  };
}


