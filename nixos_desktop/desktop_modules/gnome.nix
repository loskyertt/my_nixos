# /etc/nixos/desktop_modules/gnome.nix
{ config, lib, pkgs, ... }:

{
  # 启用 gnome 桌面
  services = {
    xserver.enable = true;  # 启用 X11 窗口系统

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    
    gnome.core-apps.enable = false;  # 不安装 GNOME 自带的应用程序
    gnome.gnome-settings-daemon.enable = true;
    gnome.gnome-keyring.enable = true;  # 启用 GNOME Keyring 守护进程
  };

  # 为 GNOME 视频软件使用 OpenGL 兼容层
  environment.sessionVariables.GDK_GL = "gles";

  environment.systemPackages = [
    # ---- GNOME 软件包 ----
    pkgs.gnome-extension-manager  # 扩展管理器
    pkgs.gnome-tweaks  # GNOME 优化工具
    # pkgs.refine  # GNOME 优化工具
    pkgs.nautilus  # 文件管理器
    pkgs.file-roller  # 压缩解压缩工具
    pkgs.gnome-text-editor  # 文本编辑器
    pkgs.gnome-font-viewer  # 字体查看器
    pkgs.gnome-logs  # 日志查看器

    # ---- GNOME 系统扩展 ----
    pkgs.gnomeExtensions.dash-to-dock  # 把 dash 转成 dock 栏
    pkgs.gnomeExtensions.clipboard-indicator  # 剪贴板历史记录
    pkgs.gnomeExtensions.appindicator  # 托盘图标
    pkgs.gnomeExtensions.coverflow-alt-tab  # Alt Tab 概览样式
    pkgs.gnomeExtensions.blur-my-shell  # 毛玻璃
    pkgs.gnomeExtensions.vitals  # 系统监视
    pkgs.gnomeExtensions.bluetooth-battery-meter  # 管理蓝牙设备
    pkgs.gnomeExtensions.user-themes  # 可在 gnome-tweaks 中设置主题
  ];
}