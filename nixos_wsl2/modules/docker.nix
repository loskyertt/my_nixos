# /etc/nixos/docker.nix
{ config, lib, pkgs, ... }:

{
  # Nvidia GPU 直通
  # hardware.nvidia-container-toolkit.enable = true;

  virtualisation.docker = {
    
    enable = true;  # 启用 Docker 守护进程
    
    package = pkgs.docker_28;  # 具体版本名取决于你当前的 nixpkgs 仓库中包含哪些定义,你可以改为你需要的版本

    # daemon.settings = {
    #   features.cdi = true;
    #   cdi-spec-dirs = ["/etc/cdi"];
    # };
  };

  # 将你的用户加入 docker 组，这里用户名是 nixos
  users.users.nixos.extraGroups = [ "docker" ];
}
