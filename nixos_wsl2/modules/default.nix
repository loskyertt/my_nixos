# /etc/nixos/modules/default.nix
{
  imports = [
    ./locale_zh.nix
    # ./nvidia.nix
    ./packages.nix
  ];
}
