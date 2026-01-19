# /etc/nixos/packages.nix
{ config, lib, pkgs, ... }:

{
  # 软件包配置
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    fastfetch
    starship
    btop
    bat
    tree
  ];

  # 配置 direnv
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
