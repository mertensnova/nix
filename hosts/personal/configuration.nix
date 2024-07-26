{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../../options/printing.nix
    ../../options/fonts.nix
    ../../options/locale.nix
    ../../options/grub.nix
    ../../options/sound.nix
    #../../modules/programs/hypr
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  myopt.hostname = "nixos";
  myopt.username = "mertens";

  myopt = {
    hyprland.enable = true;
    hyprlock.enable = true;

    tofi.enable = true;
    kitty.enable = true;
    tmux.enable = true;
    # gtk.enable = true;
    waybar.enable = true;
    nvim-config.enable = true;
    home-manager.enable = true;
  };

  hardware.pulseaudio.enable = false;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  services.gvfs.enable = true;
  services.displayManager.sddm.enable = true;
  #services.xserver.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
      xdg-desktop-portal-hyprland
      xwaylandvideobridge
    ];
  };
  #
  #xdg.portal.config.common.default = "*";
  #programs.hyprland.enable = true;
  #programs.hyprland.xwayland.enable = true;

  users.users.mertens = {
    isNormalUser = true;
    description = "mertens";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      telegram-desktop
      zathura
      keepassxc
      firefox
      xfce.thunar
      obsidian
      zed-editor
      cmatrix
      yt-dlp
      pavucontrol
      vlc
      cava
      zoom-us
      bleachbit
      hyprshot
      discord
      obs-studio
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
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
    wget
    git
    ncdu
    btop
    networkmanager
    unzip
    wireguard-tools
    hyprland
    hyprpaper
    wayland
    alejandra
    hyprlock
    brightnessctl
    nitch
    fastfetch
    pulseaudio
    android-tools
  ];

  networking.firewall.checkReversePath = "loose";
  networking.networkmanager.enable = true;

  hardware = {
    graphics.enable = true;
  };
  environment.sessionVariables = {
    NIXOS_ONZONE_WL = "1";
  };

  services.openssh.enable = true;
  system.stateVersion = "23.11"; # Did you read the comment?
}
