# /etc/nixos/nvidia.nix
{ config, lib, pkgs, ... }:

{
  # 基础驱动支持 (WSL2 下其实主要靠 ldconfig 映射)
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    open = false;   # 使用专有驱动
    
    modesetting.enable = true;
  };

  environment.sessionVariables = {
    # 允许程序找到 WSL2 的驱动库
    LD_LIBRARY_PATH = "/usr/lib/wsl/lib:${pkgs.linuxPackages.nvidia_x11}/lib";
    # 某些驱动依赖 mesa 的映射
    MESA_D3D12_DEFAULT_ADAPTER_NAME = "NVIDIA";
  };

  # 自动生成 CDI 配置文件
  systemd.services.nvidia-cdi-generator = {
    description = "Generate NVIDIA CDI spec";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.nvidia-container-toolkit}/bin/nvidia-ctk cdi generate --output=/etc/cdi/nvidia.yaml";
    };
  };
}
