{
  lib,
  pkgs,
  config,
  ...
}: {
  options.myopt = {
    gtk.enable = lib.mkEnableOption "gtk";
  };
  config = lib.mkIf config.myopt.gtk.enable {
    home-manager.users.${config.myopt.username} = {
       gtk = {
           enable = true;
          iconTheme = {
           package = pkgs.kora-icon-theme;
           name = "Kora";
        };
        };

    };
  };
}
