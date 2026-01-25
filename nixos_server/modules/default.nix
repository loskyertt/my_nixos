# /etc/nixos/modules/default.nix
{ config, lib, pkgs, ... }:

{
  imports = [
    ./fix_network.nix   # 额外的网络配置
    ./locale_zh.nix     # 系统语言设置
    ./nvidia.nix        # nvidia 配置
    ./packages.nix      # 软件包配置
    ./power.nix         # 电源管理
  ];
}
