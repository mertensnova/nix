{ inputs,config, pkgs, ... }:
{
 imports =
    [ 
       ../../options/fonts.nix
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  # Bootloader.
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };

  myopt.hostname = "nixos";
  myopt.username = "mertens";
  myopt = {
    waybar.enable = true;
    nvim-config.enable = true;
    home-manager.enable = true;
  };


 #networking.hostName = "nixos"; 
 nix.settings.experimental-features = ["nix-command" "flakes"];
 i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.gvfs.enable = true;
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = false;
  services.xserver.desktopManager.gnome.enable = false;
  services.xserver.displayManager.lightdm.enable = true;

  #xdg.portal.enable =true;
  #xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
  
  services.printing.enable = false;


xdg = {
  portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };
};
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  security.rtkit.enable = true;
  services.pipewire= {
    enable = false;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
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
      cava
      qbittorrent-qt5
      pavucontrol
      vlc
      ollama
      zoom-us
      discord
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager
    tree 
    feh
    file
    ffmpeg   
    vim
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
    fastfetch
];

networking.networkmanager.enable = true;
programs.hyprland = {
	enable = true;
	xwayland.enable = true;
};
environment.sessionVariables = {
	NIXOS_ONZONE_WL = "1";
};

hardware = {
opengl.enable = true;
};
  services.openssh.enable = true;
  system.stateVersion = "23.11"; # Did you read the comment?
}
