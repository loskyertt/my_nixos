# /etc/nixos/pkgs_modules/default.nix
{
  imports = [
    # ./games.nix  # 游戏配置
    ./packages.nix  # 系统软件包配置
    ./docker.nix  # docker 配置
  ];
}