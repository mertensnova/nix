{
  lib,
  config,
  ...
}: {
  options.myopt = {
    starship.enable = lib.mkEnableOption "starship";
  };
  config = lib.mkIf config.myopt.starship.enable {
    home-manager.users.${config.myopt.username} = {
      programs.starship = {
        enable = true;
      };
    };
  };
}
