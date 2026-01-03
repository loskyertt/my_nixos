# /etc/nixos/proxy/mihomo.nix
{ config, lib, pkgs, ... }:

{
  services.mihomo = {
    enable = true;
    package = pkgs.mihomo;
    tunMode = true;
    webui = pkgs.metacubexd;

    # 指定你的配置文件路径
    configFile = ./config.yaml;  # 注：每次修改 config.yaml 后，要执行 nixos-rebuild switch 来保证生效
  };

  # 允许服务绑定 53 端口
  systemd.services.mihomo.serviceConfig.AmbientCapabilities = [ "CAP_NET_BIND_SERVICE" "CAP_NET_ADMIN" ];
  systemd.services.mihomo.serviceConfig.CapabilityBoundingSet = [ "CAP_NET_BIND_SERVICE" "CAP_NET_ADMIN" ];

  # 内核转发
  # 默认是开启的，可以用 sysctl net.ipv4.ip_forward 查看
  # 若未开启，则取消注释即可
  # boot.kernel.sysctl = {
  #   "net.ipv4.ip_forward" = 1;
  #   # "net.ipv6.conf.all.forwarding" = 1;  # 处理 ipv6 分组，一般不需要开启
  # };

  # 仍然无法使用 TUN，可能是防火墙的原因，可以先关闭试试
  # networking.firewall.enable = false;

  # 若确实是防火墙的原因，则用下面这段配置
  networking.firewall = {
    enable = true;
    checkReversePath = "loose";
    # 填入 tun 接口名字（通过 ip a 确认）
    trustedInterfaces = [ "Meta" ];
  };
}
