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

  # 若是防火墙的原因
  networking.firewall = {
    enable = true;
    checkReversePath = "loose";
    # 填入 tun 接口名字（通过 ip a 确认）
    trustedInterfaces = [ "Meta" ];
  };

}