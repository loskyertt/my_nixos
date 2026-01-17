# /etc/nixos/pkgs_modules/games.nix
{ config, lib, pkgs, ... }:

{
  # ---- 1. 基本配置 ----
  # 启用游戏模式以提升游戏性能
  programs.gamemode.enable = true;

  # 系统软件包
  environment.systemPackages = [
    pkgs.mangohud  # 用于监控帧率、温度、CPU/GPU 负载等信息
    pkgs.protonup-qt  # 管理 proton 版本
  ];

  # proton-ge 的安装位置
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };

  # ---- 2. 配置 steam ----
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;  # 在防火墙中为Steam远程游玩打开端口
    dedicatedServer.openFirewall = true;  # 为Source专用服务器托管打开端口
    gamescopeSession.enable = true;  # 启用GameScope会话
  };
}