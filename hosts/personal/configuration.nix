{ inputs,config, pkgs, ... }:
{
 imports =
    [ 
       ../../options/fonts.nix
       ../../options/locale.nix
       ../../options/grub.nix
       ../../options/sound.nix
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];


  myopt.hostname = "nixos";
  myopt.username = "mertens";

  myopt = {
    gtk.enable = true;
    waybar.enable = true;
    nvim-config.enable = true;
    home-manager.enable = true;
  };


 nix.settings.experimental-features = ["nix-command" "flakes"];

  services.gvfs.enable = true;
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
      xdg-desktop-portal-hyprland
    ];
  };

  users.users.mertens = {
    isNormalUser = true;
    description = "mertens";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      telegram-desktop
      zathura
      firefox
      xfce.thunar
      zed-editor
      obsidian
      cmatrix
      yt-dlp
      qbittorrent-qt5
      pavucontrol
      vlc
      ollama
      zoom-us
      signal-desktop
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager
    tree
    wl-clipboard
    xdg-utils
    feh
    file
    ffmpeg   
    vim
    killall
    gvfs
    xfce.thunar-volman
    pulseaudio
    wget
    neovim
    tmux
    kitty
    git
    hyprland
    hyprpaper 
    wofi
    ncdu
    btop
    networkmanager
    lightdm
    unzip
    hyprshot
    wireguard-tools
    wayland
    hyprlock
    brightnessctl
    waybar
    nitch
  ];

networking.firewall.checkReversePath = "loose"; 
networking.networkmanager.enable = true;

programs.hyprland = {
	enable = true;
	xwayland.enable = true;
};

environment.sessionVariables = {
	NIXOS_ONZONE_WL = "1";
};

hardware = {
graphics.enable = true;
};
  services.openssh.enable = true;
  system.stateVersion = "23.11"; # Did you read the comment?
}
