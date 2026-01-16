# /etc/nixos/flake.nix

# 如果没有配置好网络代理，建议先别用 flake.nix
{
  description = "My NixOS";

  inputs = {
    # NixOS 官方软件源，这里使用 nixos-unstable 分支
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # TODO 请将下面的 nixos 替换成你的 hostname
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      # 引入模块
      modules = [
        ./configuration.nix           # 默认配置
        ./gpu_modules                 # 显卡配置
        ./proxy_modules               # 代理配置
        ./desktop_modules             # 桌面环境配置
        ./input_modules               # 输入法配置
        ./locale_zh.nix               # 中文设置
        ./fix_network.nix             # 额外的网络配置
        ./packages.nix                # 系统软件包
        ./shell.nix                   # shell 配置
        ./docker.nix                  # docker 配置
      ];
    };
  };
}
