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

  # proton 的安装位置
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };

  # ---- 2. 配置 steam ----
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;  # 在防火墙中为 Steam 远程游玩打开端口
    dedicatedServer.openFirewall = true;  # 为 Source 专用服务器托管打开端口
    gamescopeSession.enable = true;  # 启用 GameScope 会话

    package = pkgs.steam.override {
      extraPkgs = pkgs': with pkgs'; [
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib # Provides libstdc++.so.6
        libkrb5
        keyutils
        # Add other libraries as needed
      ];
    };
  };

  # 启用 Gamescope
  programs.gamescope = {
    enable = true;
    capSysNice = true;  # 允许 Gamescope 提升进程优先级，减少卡顿
  };
}
