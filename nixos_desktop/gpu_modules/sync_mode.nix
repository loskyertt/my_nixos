# /etc/nixos/gpu_modules/sync_mode.nix
{ config, lib, pkgs, ... }:

{
  # If it's an AMD integrated graphics card, change modesetting to amdgpu.
  services.xserver.videoDrivers = [ "modesetting" "nvidia" ];

  # Sync Mode
  hardware.nvidia.prime = {
    sync.enable = true;

    # Make sure to use the correct Bus ID values for your system!
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:14:0:0";
    # amdgpuBusId = "PCI:54:0:0"; For AMD GPU
  };
}
