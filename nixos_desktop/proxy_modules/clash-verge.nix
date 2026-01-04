# /etc/nixos/proxy_modules/clash-verge.nix
{ config, lib, pkgs, ... }:

{
  # 启用 clash-verge-rev
  programs.clash-verge = {
    enable = true;
    package = pkgs.clash-verge-rev;
    serviceMode = true;
    tunMode = true;
  };

  # 启用 systemd DNS 解析器守护程序 systemd-resolved（TUN 模式不管用时开启这个）
  # services.resolved.enable = true;

  # 仍然无法使用 TUN，可能是防火墙的原因，可以先关闭试试
  # networking.firewall.enable = false;

  # 仍然无法使用 TUN，可能是防火墙的原因
  networking.firewall = {
    enable = true;
    checkReversePath = "loose";
    # 填入 tun 接口名字（通过 ip a 确认）
    trustedInterfaces = [ "Meta" ];
  };
}