{
  lib,
  pkgs,
  config,
  self,
  ...
}:
{
  options.myopt = {
    gtk.enable = lib.mkEnableOption "gtk";
  };

  config = lib.mkMerge [
    (lib.mkIf config.myopt.gtk.enable {
      programs.dconf.enable = true;
      home-manager.users.${config.myopt.username} = {
        gtk.theme.name = "Tokyonight-Dark-B";
        gtk.cursorTheme.package = pkgs.bibata-cursors;
        home.packages = with pkgs; [ tokyonight-gtk-theme ];
      };
    })

  ];
}


