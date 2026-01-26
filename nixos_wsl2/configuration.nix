# /etc/nixos/configuration.nix

# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  imports = [ ];

  # ---- 1. wsl 配置 ----
  wsl.enable = true;
  wsl.defaultUser = "nixos";
  wsl.useWindowsDriver = true;

  # ---- 2. Nix 特性设置 (仅保留必要项) ----
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;  # 允许使用非自由软件
  programs.nix-ld.enable = true;  # VSCode 的 wsl 需要

  # ---- 3. 用户与安全 ----
  users.users.nixos = {
    extraGroups = ["wheel" "docker" ];
    # 用户软件包
    packages = with pkgs; [
      tree
    ];
  };

  # 配置 sudo 显示星号
  security.sudo.extraConfig = ''
    Defaults pwfeedback
  '';

  # ---- 4. 其他 ----
  system.stateVersion = "25.05";
}
