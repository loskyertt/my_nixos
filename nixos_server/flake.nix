# /etc/nixos/flake.nix

# 如果没有配置好网络代理，建议先别用 flake.nix
{
  description = "My NixOS Server";

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
				./modules								  # 其他配置模块
        ./proxy_modules           # 代理配置
        ./configuration.nix       # 默认配置
      ];
    };
  };
}
