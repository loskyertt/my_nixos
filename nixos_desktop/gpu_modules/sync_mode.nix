# /etc/nixos/gpu_modules/sync_mode.nix
{ config, lib, pkgs, ... }:

{
  # Load nvidia driver for Xorg and Wayland
  # If it's an AMD integrated graphics card, change modesetting to amdgpu.
  services.xserver.videoDrivers = [ "modesetting" "nvidia" ];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    powerManagement.enable = true;  # 休眠唤醒后不会花屏

    # powerManagement.finegrained = false;

    open = false;  # 使用专有驱动

    # Enable the Nvidia settings menu
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Sync Mode
    prime = {
      sync.enable = true;

      # Make sure to use the correct Bus ID values for your system!
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:14:0:0";
      # amdgpuBusId = "PCI:54:0:0"; For AMD GPU
    };
  };
}
