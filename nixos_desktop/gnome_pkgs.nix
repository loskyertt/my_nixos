# /etc/nixos/gnome_pkgs.nix
{ config, lib, pkgs, ... }:

{
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    
    # false: 不使用 GNOME 的应用程序
    # gnome.core-apps.enable = false;
  };

  environment.systemPackages = [
    # GNOME 软件包
    pkgs.gnome-extension-manager
    pkgs.gnome-tweaks

    # GNOME 扩展（这部分作为系统扩展，也可以不加，可单独在 gnome-extension-manager 中下载）
    pkgs.gnomeExtensions.dash-to-dock  # 把 dash 转成 dock 栏
    pkgs.gnomeExtensions.clipboard-indicator  # 剪贴板历史记录
    pkgs.gnomeExtensions.appindicator  # 托盘图标
    pkgs.gnomeExtensions.coverflow-alt-tab  # Alt Tab 概览样式
    pkgs.gnomeExtensions.blur-my-shell  # 毛玻璃
    pkgs.gnomeExtensions.vitals  # 系统监视
    pkgs.gnomeExtensions.user-themes  # 可在 gnome-tweaks 中设置主题
    pkgs.gnomeExtensions.bluetooth-battery-meter  # 管理蓝牙设备
  ];

  # 排除的 GNOME 软件包
  environment.gnome.excludePackages = (with pkgs; [
    atomix  # puzzle game
    cheese  # 摄像头拍照/录像小工具
    epiphany  # web browser
    evince  # document viewer
    geary  # email reader
    gedit  # text editor
    gnome-characters  # 特殊符号/emoji 查找器
    gnome-music  # 音乐播放器
    gnome-photos  # 图片管理/浏览
    gnome-terminal  # 终端
    gnome-tour  # 欢迎向导
    hitori  # sudoku game
    iagno  # go game
    tali  # poker game
    totem  # video player
    gnome-maps  # GNOME 版地图，基于 OpenStreetMap
    gnome-weather  # 天气
    gnome-contacts  # 联系人
  ]);
}
