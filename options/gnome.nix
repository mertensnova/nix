{pkgs, ...}: {
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnomeExtensions.blur-my-shell
    gnomeExtensions.pop-shell
    gnomeExtensions.dash-to-panel
  ];

  environment.gnome.excludePackages = with pkgs; [
    gnome-music
    cheese
    gnome-maps
    gnome-weather
    gnome-contacts
    gnome-calendar
    gnome-clocks
    gnome-characters
    gnome-font-viewer
    simple-scan
    gnome-calculator
    gnome-system-monitor
    gnome-tour
    gnome-connections
    epiphany
    geary
    evince
  ];
}
