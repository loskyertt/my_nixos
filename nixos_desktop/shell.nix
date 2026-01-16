{ config, lib, pkgs, ... }:

{
  # 配置 zsh
  programs.zsh = {
    enable = true;
    # 启用自动建议
    autosuggestions.enable = true;
    # 启用语法高亮
    syntaxHighlighting.enable = true;
  };

  # 设置默认 Shell
  users.users.sky.shell = pkgs.zsh;
}
