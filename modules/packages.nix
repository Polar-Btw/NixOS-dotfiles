{ config, pkgs, ... }:
{
  #programs main
  programs = {
  firefox.enable = true;
  steam.enable = false;
  obs-studio.enable = true;
  };
  
  # system pakages
  environment.systemPackages = with pkgs; [
    # Sddm theme config
    (pkgs.sddm-astronaut.override {
     embeddedTheme = "pixel_sakura";
        themeConfig = {
        };
    })
    kdePackages.qtmultimedia
    wget
    libva-utils
   ];
    
   # Home packages
   home-manager.users.aryu = { pkgs, ... }: {	
	home.stateVersion = "26.05";
	home.packages = with pkgs; [
		bat
		ani-cli
		tldr
		git
		neovim
		cmatrix
		vlc
		htop
		tree
		pkgs.vesktop
		kdePackages.kdenlive
	]; 
    };
  
  # Ignore warning
  nix.extraOptions = '' warn-dirty = false '';
}
