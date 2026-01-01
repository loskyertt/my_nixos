# docker 配置
{ pkgs, ... }:

{
  # 启用 Docker 服务
  virtualisation.docker.enable = true;

  # 将你的用户加入 docker 组，这样运行 docker 命令就不需要 sudo 了
  users.users.nixos.extraGroups = [ "docker" ];
}
