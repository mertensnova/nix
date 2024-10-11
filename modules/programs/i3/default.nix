{
  lib,
  config,
  pkgs,
  ...
}: {
  options.myopt = {
    i3.enable = lib.mkEnableOption "i3";
  };
  config = lib.mkIf config.myopt.i3.enable {
    home-manager.users.${config.myopt.username} = {
      services.xserver = {
        enable = true;
        desktopManager = {
          default = "none";
          xterm.enable = false;
        };
        displayManager = {
          sddm = {
            enable = true;
          };
        };
      };

      xsession.windowManager = {
        default = "i3";
        i3.enable = true;
        i3.package = pkgs.i3-gaps;
        i3.extraPackages = with pkgs; [
          dmenu
          i3lock
          i3status-rust
          i3-gaps
          i3lock-fancy
          rofi
        ];
      };
    };
  };
}
