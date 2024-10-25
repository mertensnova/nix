{
  lib,
  config,
  ...
}: {
  options.myopt = {
    hyprpaper.enable = lib.mkEnableOption "hyprpaper";
  };
  config = lib.mkIf config.myopt.hyprpaper.enable {
    home-manager.users.${config.myopt.username} = {
      services.hyprpaper.enable = true;
      services.hyprpaper.settings = {
        ipc = "on";
        splash = true;
        splash_offset = 2.0;

        preload = ["/home/mertens/Pictures/wallpapers/med.png"];

        wallpaper = [
          "eDP-1,/home/mertens/Pictures/wallpapers/med.png"
        ];
      };
    };
  };
}
