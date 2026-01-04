# /etc/nixos/proxy_modules/default.nix
{
  imports = [
    # 选择下面任意一种配置即可
    ./mihomo.nix  # mihomo 配置
    # ./clash-verge.nix  # clash-verge-rev 配置
  ];
}
