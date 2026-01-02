# /etc/nixos/proxy.nix
{ config, lib, pkgs, ... }:

{
  # 启用 clash-verge-rev
  programs.clash-verge = {
    enable = true;
    package = pkgs.clash-verge-rev;
    serviceMode = true;
    tunMode = true;
  };

  # 启用 systemd DNS 解析器守护程序 systemd-resolved（TUN 模式会用到）
  services.resolved.enable = true;

  # 仍然无法使用 TUN，可能是防火墙的原因
  # networking.firewall.checkReversePath = "loose";
}