# /etc/nixos/proxy_modules/default.nix
{
  # 选择下面任意一种配置即可
  imports = [
    ./mihomo.nix  # mihomo 配置
    # ./clash-verge.nix  # clash-verge-rev 配置
  ];
}
