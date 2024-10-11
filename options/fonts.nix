{
  pkgs,
  lib,
  ...
}: {
  config = {
    fonts.packages = with pkgs; [
      material-design-icons

      inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd
      (nerdfonts.override {
        fonts = [
          "IBMPlexMono"
          "CascadiaCode"
          "FiraCode"
          "JetBrainsMono"
        ];
      })
      noto-fonts-cjk
      dejavu_fonts
      maple-mono-NF
      noto-fonts
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
