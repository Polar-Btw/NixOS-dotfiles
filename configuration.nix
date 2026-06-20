{ config, pkgs, ... }:
{
  # import modules
  imports =
    [ 
      ./hardware-configuration.nix
      ./modules/users.nix
      ./modules/boot.nix
      ./modules/desktop.nix
      ./modules/locale.nix
      ./modules/sound.nix
      ./modules/packages.nix
    ];

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
	
  # hostname
  networking.hostName = "nixos-btw";
  
  # Enable networking
  networking.networkmanager.enable = true;

  # Nixos release version
  system.stateVersion = "26.05";
}
