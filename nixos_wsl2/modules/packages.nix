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

  # ---- 3. zsh 配置 ----
  programs.zsh = {
    enable = true;  # 启用自动建议
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;  # 启用语法高亮
  };
  # 设置默认 Shell (用户名：nixos)
  users.users.nixos.shell = pkgs.zsh;
}
