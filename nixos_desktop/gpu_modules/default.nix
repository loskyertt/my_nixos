# /etc/nixos/gpu_modules/default.nix
let
  mode = "offload";   # To enable sync, change it to “sync”
in
{
  imports = [
    ./nvidia.nix
    ./${mode}_mode.nix
  ];
}
