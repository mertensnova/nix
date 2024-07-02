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
      environment.sessionVariables = {
        GSETTINGS_SCHEMA_DIR = "${pkgs.gnome.nixos-gsettings-overrides}/share/gsettings-schemas/nixos-gsettings-overrides/glib-2.0/schemas/";
      };
      home-manager.users.${config.myopt.username} = {
        gtk.theme.name = "graphite-gtk-theme";
        gtk.cursorTheme.package = pkgs.bibata-cursors;
        home.packages = with pkgs; [ graphite-gtk-theme ];
      };
    })

  ];
}


