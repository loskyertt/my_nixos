# /etc/nixos/configuration.nix

# Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # ---- 1. 引导与系统内核 ----
  boot.loader = {
    efi.canTouchEfiVariables = true;  # 确保主板能自动识别 NixOS 启动项 
  
    grub = {
      enable = true;
      efiSupport = true;    # 生成 grubx64.efi
      device = "nodev";
      
      # 主题配置参考 Nix pkgs Source
      theme = pkgs.catppuccin-grub.override {
        flavor = "mocha";
      };
    };
  };

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # ---- 2. 网络和防火墙 ----
  networking.hostName = "nixos"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # 网络代理配置
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # 若代理软件的 TUN 模式无法使用，可能是防火墙的原因，可以先关闭试试
  # networking.firewall.enable = false;

  # 在防火墙中开放端口。
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  # ---- 3. Nix 特性设置 (仅保留必要项) ----
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;  # 允许使用非自由软件

  # ---- 4. 区域设置 ----
  time.timeZone = "Asia/Shanghai";

  # ---- 5. 硬件与多媒体 ----
  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # 音频服务配置
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
  security.rtkit.enable = true;

  # 启用触摸板支持（大多数桌面管理器默认启用）
  # services.libinput.enable = true;

  # 设置 swapfile
  swapDevices  =  [{ 
    device  =  "/var/lib/swapfile" ; 
    size  =  8 * 1024 ;  # 8 GB 
  }];

  # ---- 6. 用户与安全 ----
  # 记得用 passwd 为用户设置密码
  users.users.sky = {
    isNormalUser = true;
    description = "sky";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "qemu" "kvm" "docker" ];
    # 用户软件包
    packages = with pkgs; [
      tree
    ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # ---- 7. 系统服务 ----
  services.openssh.enable = true;  # Enable the OpenSSH daemon.

  # ---- 8. 其他 ----
  # 版本号要和自己原本系统中的该属性值一致！！！！
  system.stateVersion = "25.11";  # 永远不要修改这项
}
