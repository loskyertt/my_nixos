# /etc/nixos/pkgs_modules/packages.nix
{ config, lib, pkgs, ... }: 

{
  virtualisation.docker = {
    enable = true;  # 启用 Docker 守护进程
    # package = pkgs.docker_28;  # 指定安装版本，默认是最新版
  };

  # docker GPU 直通
  # hardware.nvidia-container-toolkit.enable = true;
  # virtualisation.dockerdaemon.settings.features.cdi = true;  # Regular Docker
}
