# /etc/nixos/shell.nix
{ config, lib, pkgs, ... }:

{
  # 启用 Zsh 及其系统级配置
  programs.zsh = {
    enable = true;
    # 启用自动建议
    autosuggestions.enable = true;
    # 启用语法高亮
    syntaxHighlighting.enable = true;
  };

  # 设置默认 Shell (用户名：nixos)
  users.users.nixos.shell = pkgs.zsh;
}
