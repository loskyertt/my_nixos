{
  description = "NixOS flake";

  inputs = {
    # NixOS 官方软件源，这里使用 nixos-25.11 分支，尽量和 system.stateVersion 保持一致
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # TODO 请将下面的 nixos 替换成你的 hostname
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        # 这里导入之前我们使用的 configuration.nix，这样旧的配置文件仍然能生效
        ./configuration.nix
      ];
    };
  };
}
