# /etc/nixos/input_modules/fcitx5.nix
{ config, lib, pkgs, ... }: 

{
  # fcitx5 环境变量设置
  environment.variables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };
  
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      (fcitx5-rime.override { rimeDataPkgs = [ rime-ice ]; })  # 雾凇拼音
      qt6Packages.fcitx5-chinese-addons  # table input method support
      fcitx5-gtk             # alternatively, kdePackages.fcitx5-qt
      catppuccin-fcitx5    # a color theme
    ];
  };
}