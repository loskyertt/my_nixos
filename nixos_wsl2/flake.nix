# /etc/nixos/flake.nix

{
  description = "My NixOS WSL2";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = { self, nixpkgs, nixos-wsl, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        
        # 引入模块
        modules = [
          nixos-wsl.nixosModules.default
          ./configuration.nix     # 系统配置
          # ./nvidia.nix            # nvidia 配置
          ./packages.nix          # 软件包管理
          ./shell.nix             # shell 配置
          ./docker.nix            # docker 配置
        ];
      };
    };
  };
}
