# /etc/nixos/docker.nix
{ config, lib, pkgs, ... }: 

{
  virtualisation.docker = {
    # 启用 Docker 守护进程
    enable = true;
    # 具体版本名取决于你当前的 nixpkgs 仓库中包含哪些定义,你可以改为你需要的版本
    package = pkgs.docker_28;
  };
  
  # 将你的用户（我这里是 sky）加入 docker 组
  users.users.sky.extraGroups = [ "docker" ];

  # hardware.nvidia-container-toolkit.enable = true;
  
  # Regular Docker
  # virtualisation.docker.daemon.settings.features.cdi = true;
  # If using Rootless Docker
  # virtualisation.docker.rootless.daemon.settings.features.cdi = true;
}
