# nvidia.nix
{ pkgs, config, lib, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true; # Для 32-битных приложений (Steam)
    };

    nvidia = {
      open = false;

      modesetting.enable = true; # Необходимо для Wayland
      powerManagement.enable = true; # Управление питанием

      package = config.boot.kernelPackages.nvidiaPackages.latest; # production - стабильная версия 550
      forceFullCompositionPipeline = true;
      nvidiaSettings = true; # Панель управления NVIDIA
    };
  };

  # Блокировать Nouveau (он не нужен)
  boot.kernelParams = [ "module_blacklist=i915" ];
  boot.blacklistedKernelModules = [ "nouveau" ];

}
