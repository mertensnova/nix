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
      };
    })
  ];
}
