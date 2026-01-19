# /etc/nixos/modules/default.nix
{
  imports = [
    ./docker.nix
    ./locale_zh.nix
    # ./nvidia.nix
    ./packages.nix
    ./shell.nix
  ];
}
