# /etc/nixos/input_modules/default.nix
{
  # 选择下面任意一种配置即可
  imports = [
    # ./fcitx5.nix  # fcitx5 配置
    ./ibus.nix  # ibus 配置（GNOME 下推荐）
  ];
}