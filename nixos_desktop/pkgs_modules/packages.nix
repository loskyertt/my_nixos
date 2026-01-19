# /etc/nixos/pkgs_modules/packages.nix
{ config, lib, pkgs, ... }: 

{
  # 启用 firefox
  # programs.firefox.enable = true;

  # 系统软件包
  environment.systemPackages = [
    pkgs.vim
    pkgs.git
    pkgs.wget
    pkgs.bat
    pkgs.fastfetch
    pkgs.starship  # 终端美化
    pkgs.ghostty  # 终端
    pkgs.btop  # CLI 资源监视
    pkgs.google-chrome
    pkgs.vscode
    pkgs.mission-center  # 资源监视

    # ---- GStreamer 插件（多媒体库）----
    pkgs.gst_all_1.gst-plugins-base
    pkgs.gst_all_1.gst-plugins-good
    pkgs.gst_all_1.gst-plugins-bad
    pkgs.gst_all_1.gst-plugins-ugly
  ];

  # 配置 direnv
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
