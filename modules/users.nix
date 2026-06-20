{ config, pkgs, ... }:
{
  # User accounts	
  users.users."aryu" = {
    isNormalUser = true;
    description = "aryu";
    extraGroups = [ 
    "networkmanager" # Enable network
    "wheel" # Enable sudo permissions 
    ];
  };
}
