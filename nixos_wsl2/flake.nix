# /etc/nixos/flake.nix

{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = { self, nixpkgs, nixos-wsl, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        # 在这里引入其它配置模块
        modules = [
          nixos-wsl.nixosModules.default
          ./configuration.nix
        ];
      };
    };
  };
}
