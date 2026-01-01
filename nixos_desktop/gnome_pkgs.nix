# /etc/nixos/gnome_pkgs.nix
{ config, lib, pkgs, ... }: 

{
  # gnome 软件包
  environment.systemPackages = [
    pkgs.gnome-extension-manager
    pkgs.gnome-tweaks
  ];
}
