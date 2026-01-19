# /etc/nixos/pkgs_modules/packages.nix
{ config, lib, pkgs, ... }: 

{
  # 系统软件包
  environment.systemPackages = [
    pkgs.vim
    pkgs.git
    pkgs.wget
    pkgs.bat
    pkgs.nvtopPackages.full  # nvtop
    pkgs.fastfetch
    pkgs.starship  # 终端美化
    pkgs.btop  # CLI 资源监视
  ];

  # 配置 direnv
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
