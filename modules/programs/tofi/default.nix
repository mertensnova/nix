{
  lib,
  config,
  ...
}: {
  options.myopt = {
    tofi.enable = lib.mkEnableOption "tofi";
  };
  config = lib.mkIf config.myopt.tofi.enable {
    home-manager.users.${config.myopt.username} = {
      programs.tofi = {
        enable = true;
        settings = {
          font-size = lib.mkForce 12;
          outline-width = 0;
          border-width = 0;
          padding-left = "4%";
          padding-top = "2%";
          padding-right = 0;
          padding-bottom = 0;
          width = 640;
          height = 480;
        };
      };
    };
  };
}
