# /etc/nixos/gpu_modules/nvidia.nix
{ config, lib, pkgs, ... }:

{
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Load nvidia driver for Xorg and Wayland
  # services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # powerManagement.enable = false;

    # powerManagement.finegrained = false;

    open = false;

    # Enable the Nvidia settings menu,
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
