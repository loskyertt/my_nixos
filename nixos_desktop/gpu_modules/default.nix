# /etc/nixos/gpu_modules/default.nix
{ config, lib, pkgs, ... }:

{
  # 开启图形加速支持
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # 如果有 Nvidia 显卡，根据需求选择下面一种配置
  imports = [
    # ./nvidia.nix  # 用于台式机（独立 Nvidia 显卡）
    # ./dual_mode.nix  # 用于笔记本电脑（双启动模式：offload + sync）
    # ./offload_mode.nix  # 用于笔记本电脑（offload 模式）
    # ./sync_mode.nix  # 用于笔记本电脑（sync 模式）
  ];
}
