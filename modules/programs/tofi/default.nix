{
  lib,
  config,
  pkgs,
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
font = "JetBrainsMono Nerd Font";
font-size = 12;

outline-width = 0;
border-width = 0;
padding-left = "4%";
padding-top = "2%";
padding-right = 0;
padding-bottom = 0;

background-color = "#111";
text-color = "#f9fbff";
selection-color = "#933";
width = 640;
height = 480;
};
      };

    };
  };
}
