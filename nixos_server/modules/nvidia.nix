# /etc/nixos/modules/nvidia.nix
{ config, lib, pkgs, ... }:

{
  # 开启图形加速支持
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
	
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {

    # 开启模式设置（虽然是服务器，但也建议开启以获得更好的内核兼容性）
    modesetting.enable = true;

		# 电源管理：服务器建议关闭，防止驱动进入过深的休眠导致唤醒延迟
    powerManagement.enable = false;

    powerManagement.finegrained = false;

    # 确保所有 GPU 即使在无头模式下也能保持运行状态
    nvidiaPersistenced = true;

    # 使用专有驱动
    open = false;

    # 服务器不需要 nvidia-settings
    nvidiaSettings = false;

    # 根据需要，您可能需要为您的特定显卡选择合适的驱动程序版本
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
