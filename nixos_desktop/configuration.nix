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
    # 挂载到 /mnt/boot/efi：
    efi.efiSysMountPoint = "/boot/efi";  # 默认是 "/boot"
  
    grub = {
      enable = true;
      efiSupport = true;    # 生成 grubx64.efi
      device = "nodev";
      useOSProber = true;  # 自动识别其他 OS 的引导项
      
      # 主题配置参考 Nix pkgs Source
      theme = pkgs.catppuccin-grub.override {
        flavor = "mocha";
      };
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;  # latest kernel
  # boot.kernelPackages = pkgs.linuxPackages_zen;  # zen kernel
  # boot.kernelParams = [ 
  #   # "quiet" 
  #   # "splash" 
  #   "i915.enable_psr=0"  # 禁用 Intel 的面板自刷新（解决 steam gamescope 屏幕闪烁问题）
  # ];

  # ---- 2. 网络和防火墙 ----
  networking.hostName = "nixos"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # 网络代理配置
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # 关闭防火墙
  # networking.firewall.enable = false;

  # 在防火墙中开放端口
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  # ---- 3. Nix 特性设置 (仅保留必要项) ----
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;  # 允许使用非自由软件

  # ---- 4. 区域和时钟设置 ----
  time.timeZone = "Asia/Shanghai";
  # time.hardwareClockInLocalTime = true;  # 将 RTC 时间标准设置为本地时间，与 Windows 的默认配置兼容

  # ---- 5. 硬件与多媒体 ----
  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # 开启图形加速支持
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

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

  # 配置 sudo 输入密码时显示星号
  security.sudo.extraConfig = ''
    Defaults pwfeedback
  '';

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # ---- 7. 系统服务 ----
  services.openssh.enable = true;  # Enable the OpenSSH daemon.
  services.flatpak.enable = true;
  # 启用 systemd DNS 解析器守护程序 systemd-resolved
  # services.resolved.enable = true;  # TUN 模式不管用时可以开启这个试试

  # ---- 8. 其他 ----
  # 版本号要和自己原本系统中的该属性值一致！！！！
  system.stateVersion = "25.11";  # 永远不要修改这项
}
