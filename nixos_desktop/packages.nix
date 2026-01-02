# /etc/nixos/packages.nix
{ config, lib, pkgs, ... }: 

{
  # 系统软件包
  environment.systemPackages = [
    pkgs.vim
    pkgs.git
    pkgs.wget
    pkgs.bat
    pkgs.fastfetch
    pkgs.starship
    pkgs.btop
    pkgs.google-chrome
    pkgs.vscode
  ];
  
  # 字体设置
  fonts.packages = with pkgs; [
    # noto-fonts-cjk-sans  # 思源黑体，覆盖所有 CJK 字符
    # noto-fonts-cjk-serif  # 宋体
    noto-fonts-emoji  # emoji
    # Maple Mono (Ligature TTF unhinted)
    maple-mono.truetype
    # Maple Mono NF (Ligature unhinted)
    maple-mono.NF-unhinted
    # Maple Mono NF CN (Ligature unhinted)
    maple-mono.NF-CN-unhinted
  ];
}
