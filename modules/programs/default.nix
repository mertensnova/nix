{
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./nvim
    ./waybar
    ./tmux
    ./kitty
    ./tofi
    ./hypr
    ./zsh
  ];
  options.myopt = {
    home-manager.enable = lib.mkEnableOption "home-manager";
  };
  config = lib.mkIf config.myopt.home-manager.enable {
    environment.sessionVariables = rec {
      XDG_BIN_HOME = "$HOME/.local/bin";
      PATH = [
        "${XDG_BIN_HOME}"
      ];
    };

    home-manager.users.${config.myopt.username} = {
      home.stateVersion = config.system.stateVersion;
    };
  };
}
