{ config, pkgs, ...}:
{	
  # Disable X11.
  services.xserver.enable = false;

  # Enable the KDE Plasma and SDDM
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
	enable = true;
	theme = "sddm-astronaut-theme";
	wayland.enable = true;
    };
  
  # Remove Bloat
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
  	elisa
  	okular
  	qrca
	discover
    	kate
  ];
  
  # fonts
  fonts.packages = with pkgs; [
  noto-fonts-cjk-sans
  nerd-fonts.jetbrains-mono
  ];
}
