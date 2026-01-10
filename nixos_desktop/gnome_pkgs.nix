# /etc/nixos/gnome_pkgs.nix
{ config, lib, pkgs, ... }:

{
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    
    # false: 不使用 GNOME 的应用程序
    # gnome.core-apps.enable = false;

    # 启用 GNOME Keyring 守护进程
    # gnome.gnome-keyring.enable = true;
  };

  environment.systemPackages = [
    # GNOME 软件包
    pkgs.gnome-extension-manager  # 扩展管理器
    pkgs.gnome-tweaks  # GNOME 优化工具
    pkgs.ghostty  # 终端
    pkgs.mission-center  # 资源监视

    # 下面这些应用已包含进了 core-apps 中
    # pkgs.baobab  # 磁盘使用情况分析器
    # pkgs.gnome-calculator  # 计算器
    # pkgs.gnome-clocks  # 时钟
    # pkgs.gnome-font-viewer  # 字体查看器
    # pkgs.gnome-logs  # 日志查看器
    # pkgs.nautilus  # 文件管理器
    # pkgs.gnome-text-editor  # 文本编辑器

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
    gnome-console  # 终端
  ]);
}
