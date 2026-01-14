# /etc/nixos/configuration.nix

# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  imports = [
    ./packages.nix  # 软件包管理
    ./shell.nix  # shell 配置
    ./docker.nix  # docker 配置
  ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  # 启用 flakes 实验功能
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # 让 NixOS 能够运行那些“动态链接”的外部程序
  programs.nix-ld.enable = true;

  # 允许使用非自由软件
  nixpkgs.config.allowUnfree = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
