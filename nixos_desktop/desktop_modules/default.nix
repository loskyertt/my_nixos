# /etc/nixos/desktop_modules/default.nix
{
  # 选择下面任意一种配置即可
  imports = [
    ./gnome.nix  # GNOME 桌面环境
  ];
}