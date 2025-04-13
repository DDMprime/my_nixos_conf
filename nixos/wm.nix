{ pkgs, ... }:

{
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.

  #services.displayManager.sddm.enable = true;
  #services.displayManager.sddm = {
    #wayland.enable = true;
  #  enable = true;
  #};

  #services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  #services.xserver.xkb = {
  #    layout = "us";
  #    variant = "";
  #};


  # Enable the XCFE Desktop Environment
  #services.xserver.desktopManager.xfce.enable = true;
  #services.xserver.displayManager.lightdm.enable = true;


  # Enable the Hyprland Desktop Environment
  services.udisks2.enable = true;
  services.dbus.enable = true;
  services.gvfs.enable = true;

  services.displayManager.sddm.enable = true;
  environment.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    WLR_NO_HARDWARE_CURSORS = "1"; # Решает проблемы с курсором
    NIXOS_OZONE_WL = "1"; # Для Wayland-совместимых приложений
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true; # Для X11-приложений
  };


}
