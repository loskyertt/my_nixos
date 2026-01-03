# /etc/nixos/gnome_pkgs.nix
{ config, lib, pkgs, ... }:

{
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    
    # false: 不使用 gnome 的应用程序
    # gnome.core-apps.enable = false;
  };

  # gnome 软件包
  environment.systemPackages = [
    pkgs.gnome-extension-manager
    pkgs.gnome-tweaks
  ];

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
