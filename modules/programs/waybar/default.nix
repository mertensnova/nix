{
  lib,
  config,
  ...
}: {
  imports = [./settings.nix ./styles.nix];
  options.myopt = {
    waybar.enable = lib.mkEnableOption "waybar";
  };
  config = lib.mkIf config.myopt.waybar.enable {
    home-manager.users.${config.myopt.username} = {
      programs.waybar = {
        enable = true;
      };
    };
  };
}
