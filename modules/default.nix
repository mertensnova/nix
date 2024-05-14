{
  lib,
  config,
  ...
}: {
  imports = [./programs];

  options.myopt = {
    hostname = lib.mkOption {
      description = "Hostname for this system";
      type = lib.types.str;
    };

    username = lib.mkOption {
      description = "Username for this system";
      type = lib.types.str;
    };
  };

  config = {
    networking.hostName = config.myopt.hostname;
    users.users.${config.myopt.username} = {
      isNormalUser = true;
      extraGroups = ["wheel"];
    };
  };
}
