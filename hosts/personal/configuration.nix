{ inputs,config, pkgs, ... }:
{
 imports =
    [ 
       ../../options/fonts.nix
       ../../options/locale.nix
       ../../options/grub.nix
       ../../options/sound.nix
      # ../../modules/programs/hypr
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];


  myopt.hostname = "nixos";
  myopt.username = "mertens";

  myopt = {
    tofi.enable = true;
    kitty.enable =true;
    tmux.enable =true;
  #  gtk.enable = true;
    waybar.enable = true;
    nvim-config.enable = true;
    home-manager.enable = true;
  };

 nix.settings.experimental-features = ["nix-command" "flakes"];

  services.gvfs.enable = true;
  services.xserver.displayManager.lightdm.enable = true;  
  services.xserver.enable = true;

   # Enable nix ld
 # programs.nix-ld.enable = true;
xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
      xdg-desktop-portal-hyprland
    ];
  };
programs.hyprland = {
	enable = true;
	xwayland.enable = true;
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
      obsidian
      zed-editor
      cmatrix
      yt-dlp
      qbittorrent-qt5
      pavucontrol
      vlc
      cava
      zoom-us
      bleachbit
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager
    tree
    dwarfs
    fuse-overlayfs
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
    tmux
    git
    neovim
    ncdu
    btop
    networkmanager
    lightdm
    unzip
    wireguard-tools
    kitty
    tofi
    hyprland
    hyprpaper 
    wayland
    hyprshot
    hyprlock
    waybar
    brightnessctl
    nitch
    htop
    fastfetch
  ];

networking.firewall.checkReversePath = "loose"; 
networking.networkmanager.enable = true;

environment.sessionVariables = {
	NIXOS_ONZONE_WL = "1";
};

hardware = {
graphics.enable = true;
};
  services.openssh.enable = true;
  system.stateVersion = "23.11"; # Did you read the comment?
}
