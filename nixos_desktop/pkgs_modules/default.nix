# /etc/nixos/pkgs_modules/default.nix
{
  imports = [
    ./flatpak.nix   # flatpak 配置
    # ./games.nix  # 游戏配置
    ./packages.nix  # 系统软件包配置
  ];
}