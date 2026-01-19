# /etc/nixos/configuration.nix

# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  imports = [ ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  # 启用 flakes 实验功能
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # 让 NixOS 能够运行那些“动态链接”的外部程序
  programs.nix-ld.enable = true;

  # 允许使用非自由软件
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
