# /etc/nixos/modules/default.nix
{ config, lib, pkgs, ... }:

{
  imports = [
    ./docker.nix        # docker 配置
    ./fix_network.nix   # 额外的网络配置
    ./nvidia.nix        # nvidia 配置
    ./packages.nix      # 软件包配置
    ./power.nix         # 电源管理
    ./shell.nix         # shell 配置
  ];
}
