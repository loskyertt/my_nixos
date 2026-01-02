# /etc/nixos/gpu_modules/offload_mode.nix
{ config, lib, pkgs, ... }:

{
  # If it's an AMD integrated graphics card, change modesetting to amdgpu.
  services.xserver.videoDrivers = [ "modesetting" "nvidia" ];

  # Offload Mode
  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;  # 自动生成 nvidia-offload 命令
    };

    # Make sure to use the correct Bus ID values for your system!
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:14:0:0";
    # amdgpuBusId = "PCI:54:0:0"; For AMD GPU
  };
}
