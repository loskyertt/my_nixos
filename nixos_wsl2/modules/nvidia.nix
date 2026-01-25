# /etc/nixos/nvidia.nix
{ config, lib, pkgs, ... }:

{
  # ---- 1. 基础驱动支持 ----
  # WSL2 下其实主要靠 ldconfig 映射
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;  # 50 系推荐使用开源驱动

  # ---- 2. WSL2 环境变量 ----
  environment.sessionVariables = {
    # CUDA 配置
    # CUDA_PATH = "${pkgs.cudatoolkit}";
    # EXTRA_LDFLAGS = "-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib";
    # EXTRA_CCFLAGS = "-I/usr/include";
    LD_LIBRARY_PATH = [
      "/usr/lib/wsl/lib"  # WSL2 GPU 驱动路径
      "${pkgs.linuxPackages.nvidia_x11}/lib"
    ];
    MESA_D3D12_DEFAULT_ADAPTER_NAME = "NVIDIA";
  };

  # ---- 3. docker GPU 直通 ----
  hardware.nvidia-container-toolkit = {
    enable = true;
    mount-nvidia-executables = false;  # WSL2 需要禁用
  };

  # 手动生成 CDI 配置（使用 nvidia-container-toolkit）
  systemd.services.nvidia-cdi-generator = {
    description = "Generate NVIDIA CDI spec";
    wantedBy = [ "docker.service" ];
    before = [ "docker.service" ];  # 确保在 Docker 之前运行
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.nvidia-container-toolkit}/bin/nvidia-ctk cdi generate --output=/etc/cdi/nvidia.yaml --nvidia-ctk-path=${pkgs.nvidia-container-toolkit}/bin/nvidia-ctk";
    };
  };

  virtualisation.docker.daemon.settings = {
    features.cdi = true;
    cdi-spec-dirs = [ "/etc/cdi" ];
  };
}
