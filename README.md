# 1. NixOS 桌面配置

```bash
.
├── configuration.nix
├── desktop_modules
│   ├── default.nix
│   └── gnome.nix
├── fix_network.nix
├── flake.nix
├── input_modules
│   ├── default.nix
│   ├── fcitx5.nix
│   └── ibus.nix
├── locale_zh.nix
├── nvidia_modules
│   ├── default.nix
│   ├── dual_mode.nix
│   ├── nvidia.nix
│   ├── offload_mode.nix
│   └── sync_mode.nix
├── pkgs_modules
│   ├── default.nix
│   ├── docker.nix
│   ├── games.nix
│   └── packages.nix
└── proxy_modules
    ├── clash-verge.nix
    ├── config.yaml
    ├── default.nix
    ├── mihomo.nix
    └── zashboard
```

---

# 2. NixOS Server 配置

```bash
.
├── configuration.nix
├── flake.nix
├── modules
│   ├── default.nix
│   ├── docker.nix
│   ├── fix_network.nix
│   ├── locale_zh.nix
│   ├── nvidia.nix
│   ├── packages.nix
│   └── power.nix
└── proxy_modules
    ├── config.yaml
    ├── default.nix
    └── mihomo.nix
```

---

# 3. NixOS WSL2 配置

```bash
.
├── configuration.nix
├── flake.nix
└── modules
    ├── default.nix
    ├── docker.nix
    ├── locale_zh.nix
    ├── nvidia.nix
    └── packages.nix
```