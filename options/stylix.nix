{pkgs, ...}: let
  themes = {
    oxocarbon-dark = "oxocarbon-dark";
    lackluster = {
      scheme = "Lackluster dark";
      author = "Mertens";
      base00 = "#101010"; # background
      base01 = "#080808"; # (Black)
      base02 = "#191919"; # (Bright Black)
      base03 = "#2a2a2a"; # (gray)
      base04 = "#555555"; # (light gray)
      base05 = "#deeeed"; # foreground
      base06 = "#f0f0f0"; # (light foreground)
      base07 = "#ffffff"; # (lightest foreground)
      base08 = "#e64a6b"; # (Bright red)
      base09 = "#e69b7b"; # (Orange)
      base0A = "#f0c674"; # (Yellow)
      base0B = "#789978"; # (Green)
      base0C = "#6f8595"; # (Cyan)
      base0D = "#7788AA"; # (Blue)
      base0E = "#b86cd4"; # (magenta)
      base0F = "#e64a6b"; # (Dark red)
    };
  };
in {
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = themes.lackluster;
    polarity = "dark";
    cursor = {
      package = pkgs.apple-cursor;
      name = "macOS-BigSur-White";
      size = 24;
    };

    opacity = {
      applications = 1.0;
      terminal = 1.0;
      desktop = 1.0;
      popups = 1.0;
    };
  };
}
