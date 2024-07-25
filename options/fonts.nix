{
  pkgs,
  lib,
  ...
}: {
  config = {
    fonts.packages = with pkgs; [
      material-design-icons
      (nerdfonts.override {
        fonts = [
          "JetBrainsMono"
        ];
      })
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
    ];
  };

  options = {
    fonts = {
      defaultFonts = {
        monospace = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = ["JetBrainsMono"];
        };

        sansSerif = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = ["JetBrainsMono"];
        };

        serif = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = ["JetBrainsMono"];
        };

        emoji = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = ["Material Design Icons"];
        };
      };
    };
  };
}
