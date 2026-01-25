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
        # ./nvidia_modules              # 显卡模块
        ./proxy_modules               # 代理模块
        ./desktop_modules             # 桌面环境模块
        ./input_modules               # 输入法模块
        ./pkgs_modules                # 软件包管理模块
        ./configuration.nix           # 默认配置
        ./fix_network.nix             # 额外的网络配置
        ./locale_zh.nix               # 中文设置
      ];
    };
  };
}
