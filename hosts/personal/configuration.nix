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
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  myopt.hostname = "nixos";
  myopt.username = "mertens";

  myopt = {
    home-manager.enable = true;
    hyprland.enable = true;
    hyprlock.enable = true;
    hyprpaper.enable = true;

    tofi.enable = true;
    kitty.enable = true;
    tmux.enable = true;
    zsh.enable = true;
    waybar.enable = true;
    nvim-config.enable = true;
  };
  hardware.pulseaudio.enable = false;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  services.gvfs.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  programs.nix-ld.enable = true;
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
      burpsuite
      discord
      neovide
    ];
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
      xdg-desktop-portal-hyprland
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    tree
    wl-clipboard
    xdg-utils
    feh
    file
    ffmpeg
    vim
    gvfs
    xfce.thunar-volman
    wget
    git
    ncdu
    btop
    networkmanager
    unzip
    wireguard-tools
    wayland
    alejandra
    brightnessctl
    nitch
    fzf
    fastfetch
    pulseaudio
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
