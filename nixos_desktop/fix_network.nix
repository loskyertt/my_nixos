# /etc/nixos/fix_network.nix
{ config, pkgs, lib, ... }:

{
  nix.settings = {
    # 镜像源配置（按顺序，优先使用国内镜像）
    # substituters = lib.mkForce [
    #   "https://mirror.sjtu.edu.cn/nix-channels/store"  # 上交镜像源
    #   "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"  # 清华镜像源
    #   "https://mirrors.ustc.edu.cn/nix-channels/store"  # 中科大镜像源
    #   "https://cache.nixos.org/"
    # ];

    # 增大下载缓存，防止大文件下载中断 (500MB)
    download-buffer-size = 524288000;
    
    # 仓库连接时间设为 5 秒
    # connect-timeout = 5;

    # 若二进制缓存下载失败，允许 Nix 尝试从源码编译
    fallback = true;
    
    # 自动优化存储，节省空间
    auto-optimise-store = true;
  };

  # 配置 GitHub Token
  # nix.extraOptions = ''
  #   !include /etc/nix/github-access-tokens
  # '';
}
