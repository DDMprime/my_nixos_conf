{  pkgs, ... }:

{
  users.users.ddm = {
    isNormalUser = true;
    description = "DDM";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "ddm";
}
