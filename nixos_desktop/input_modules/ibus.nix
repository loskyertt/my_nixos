# /etc/nixos/input_modules/ibus.nix
{ config, lib, pkgs, ... }: 

{
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      # 注入雾凇拼音数据
      (rime.override { rimeDataPkgs = [ pkgs.rime-ice ]; })
    ];
  };
}