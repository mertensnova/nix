{
  lib,
  pkgs,
  config,
  ...
}: {
  options.myopt = {
    gtk.enable = lib.mkEnableOption "gtk";
  };
  config = lib.mkMerge [
    (lib.mkIf config.myopt.gtk.enable {
      programs.dconf.enable = true;
      home-manager.users.${config.myopt.username} = {
        gtk.font.name = "JetBrainsMono Nerd Font 14";
        gtk.theme.name = "Tokyonight-Dark-B";
        gtk.cursorTheme.package = pkgs.bibata-cursors;
        home.packages = with pkgs; [
          gnome.gnome-themes-extra
          gtk-engine-murrine
          tokyonight-gtk-theme
        ];
      };
    })
  ];
}
