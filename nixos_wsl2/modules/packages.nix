# /etc/nixos/packages.nix
{ config, lib, pkgs, ... }:

{
  # ---- 1. 软件包配置 ----
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

  # ---- 2. 配置 direnv ----
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # ---- 3. 配置 docker ----
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
