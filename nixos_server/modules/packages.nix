# /etc/nixos/pkgs_modules/packages.nix
{ config, lib, pkgs, ... }: 

{
  # ---- 1. 系统软件包 ----
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

  # ---- 2. direnv 配置 ----
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # ---- 3. docker 配置 ----
  virtualisation.docker = {
    enable = true;  # 启用 Docker 守护进程
    # package = pkgs.docker_28;  # 指定安装版本，默认是最新版
  };

  # ---- 4. zsh 配置 ----
  programs.zsh = {
    enable = true;  # 启用自动建议
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;  # 启用语法高亮
  };

  # 设置默认 Shell (用户名：nixos)
  users.users.nixos.shell = pkgs.zsh;
}
