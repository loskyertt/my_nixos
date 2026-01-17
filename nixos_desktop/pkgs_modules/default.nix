# /etc/nixos/pkgs_modules/default.nix
{
  imports = [
    ./docker.nix      # docker 配置
    # ./games.nix       # 游戏配置
    ./shell.nix       # shell 配置
    ./sys_pkgs.nix    # 系统软件包配置
  ];
}