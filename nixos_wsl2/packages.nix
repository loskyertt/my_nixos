# /etc/nixos/packages.nix
{ pkgs, ... }: # 声明它需要用到 pkgs

{
  # 软件包配置
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    fastfetch
    zsh
    starship
    htop
    bat
  ];
  
  # 字体配置
  fonts.packages = with pkgs; [
    # 在 NixOS 24.05 及之后版本，建议这样写：
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
];
}
