{ config, pkgs, ...}:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
   # Support for ntfs filesystems
  boot.supportedFilesystems = [ "ntfs" ];

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
	
  # Hardware options
    hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
    intel-media-driver    
    vpl-gpu-rt      
    libva-vdpau-driver
    libvdpau-va-gl
      ];
    };

  # Force the kernel to load GuC/HuC firmware
   boot.kernelParams = ["i915.enable_guc=3"];
     
  # environment variable
  environment.sessionVariables = {
  LIBVA_DRIVER_NAME = "iHD";
  };
}
