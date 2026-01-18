# /etc/nixos/input_modules/ibus.nix
{ config, lib, pkgs, ... }: 

{
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      rime  # 数据目录：~/.config/ibus/rime
    ];
  };
}