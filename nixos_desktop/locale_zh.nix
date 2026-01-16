# /etc/nixos/locale_zh.nix
{ config, pkgs, lib, ... }:

{
  # 设置系统的中文环境
  i18n = {
    defaultLocale = "zh_CN.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "zh_CN.UTF-8";
      LC_IDENTIFICATION = "zh_CN.UTF-8";
      LC_MEASUREMENT = "zh_CN.UTF-8";
      LC_MONETARY = "zh_CN.UTF-8";
      LC_NAME = "zh_CN.UTF-8";
      LC_NUMERIC = "zh_CN.UTF-8";
      LC_PAPER = "zh_CN.UTF-8";
      LC_TELEPHONE = "zh_CN.UTF-8";
      LC_TIME = "zh_CN.UTF-8";
    };

    supportedLocales = [ "zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
  };

  # 字体配置
  fonts = {
    fontDir.enable = true;  # 启用旧版字体路径兼容
    packages = with pkgs; [
      cascadia-code
      noto-fonts
      noto-fonts-cjk-sans           # 思源黑体
      noto-fonts-cjk-serif          # 思源宋体
      noto-fonts-color-emoji        # emoji
      source-han-sans               # 思源黑体
      maple-mono.truetype           # Maple Mono (Ligature TTF unhinted)
      maple-mono.NF-unhinted        # Maple Mono NF (Ligature unhinted)
      maple-mono.NF-CN-unhinted     # Maple Mono NF CN (Ligature unhinted)
    ];
    
    fontconfig = {
      defaultFonts = {
        sansSerif = [ "Noto Sans CJK SC" "DejaVu Sans" ];
        serif = [ "Noto Serif CJK SC" "DejaVu Serif" ];
        monospace = [ "Cascadia Code" "Noto Sans Mono CJK SC" ];
      };
    };
  };
}
