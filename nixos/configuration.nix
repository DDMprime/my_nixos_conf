{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./wm.nix
      ./user.nix
      ./modules/bundle.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest; #latest ядро, стабильное (LTS) - 6_12

  boot.extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ]; #для создания виртуальной камеры
  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=10 card_label="OBS Virtual Camera" exclusive_caps=1
  '';


  boot.kernelParams = [ "nvidia_drm.modeset=1" ];



  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Yekaterinburg";

  i18n.defaultLocale = "ru_RU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.printing.enable = true;

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;
  programs.fuse.userAllowOther = true; # для appimage


  system.stateVersion = "25.05";

}
