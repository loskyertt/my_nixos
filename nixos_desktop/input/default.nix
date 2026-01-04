# /etc/nixos/input/default.nix
  imports = [
    # 选择下面任意一种配置即可
    # ./fcitx5.nix  # fcitx5 配置
    ./ibus.nix  # ibus 配置（GNOME 下推荐）
  ];