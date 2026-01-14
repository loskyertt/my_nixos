# /etc/nixos/nvidia.nix
{ config, lib, pkgs, ... }:

{
  hardware.nvidia = {
    # 如果你发现 open = true 导致某些功能异常，可以尝试改为 false
    open = true;  # 必须显式设置此项，解决 560+ 版本驱动的报错
    
    modesetting.enable = true;
  };

  # 1. 基础驱动支持 (WSL2 下其实主要靠 ldconfig 映射)
  services.xserver.videoDrivers = [ "nvidia" ];
  
  # 2. 启用 NVIDIA 容器工具包 (GPU 直通 Docker)
  hardware.nvidia-container-toolkit.enable = true;

  # 3. 环境变量优化：只保留必要的库路径，删除 CUDA_PATH
  environment.sessionVariables = {
    # 允许程序找到 WSL2 的驱动库
    LD_LIBRARY_PATH = "/usr/lib/wsl/lib:${pkgs.linuxPackages.nvidia_x11}/lib";
    # 某些驱动依赖 mesa 的映射
    MESA_D3D12_DEFAULT_ADAPTER_NAME = "NVIDIA";
  };

  # 4. Docker 配置：保持使用 CDI 模式
  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      features = { cdi = true; };
      cdi-spec-dirs = ["/etc/cdi"];
    };
  };

  # 5. 自动生成 CDI 配置文件
  systemd.services.nvidia-cdi-generator = {
    description = "Generate NVIDIA CDI spec";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.nvidia-container-toolkit}/bin/nvidia-ctk cdi generate --output=/etc/cdi/nvidia.yaml";
    };
  };
}
