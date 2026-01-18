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
    # 如果是挂载到 /mnt/boot/efi：
    efi.efiSysMountPoint = "/boot/efi";  # 默认是 "/boot"
  
    grub = {
      enable = true;
      efiSupport = true;    # 生成 grubx64.efi
      device = "nodev";
      # useOSProber = true;  # 自动识别其他 OS 的引导项
      
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

  # WiFi is automatically configured during system deployment
  networking.networkmanager = {
    enable = true;
    # 确保在系统启动时自动建立连接
    ensureProfiles.profiles = {
      "MyHomeWifi" = {
        connection = {
          id = "your_wifi_name";  # WiFi 名称，用 `nmcli connection show` 获得
          type = "wifi";
          autoconnect = true;
					permissions = "";  # 确保该连接在系统层级生效，不绑定特定用户
        };
        wifi = {
          mode = "infrastructure";
          ssid = "your_wifi_SSID";  # 你连接的 WiFi 的 SSID
        };
        wifi-security = {
          auth-alg = "open";
          key-mgmt = "wpa-psk";  # 密钥管理方式，家用 WiFi 几乎都是 WPA-PSK
          psk = "your_wifi__secret";  # 你的 WiFi 密码
        };
      };
    };
  };

  # 网络代理配置
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # 若代理软件的 TUN 模式无法使用，可能是防火墙的原因，可以先关闭试试
  # networking.firewall.enable = false;

  # 在防火墙中开放端口
  networking.firewall.allowedTCPPorts = [ 22 9090 ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  # ---- 3. Nix 特性设置 (仅保留必要项) ----
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;  # 允许使用非自由软件

  # ---- 4. 区域和时钟设置 ----
  time.timeZone = "Asia/Shanghai";
  # time.hardwareClockInLocalTime = true;  # 将 RTC 时间标准设置为本地时间，与 Windows 的默认配置兼容

  # ---- 5. 硬件 ----
  # 设置 swapfile
  swapDevices  =  [{ 
    device  =  "/var/lib/swapfile" ; 
    size  =  16 * 1024 ;  # 16 GB 
  }];

  # ---- 6. 用户与安全 ----
  # 记得用 passwd 为用户设置密码
  users.users.sky = {
    isNormalUser = true;
    description = "sky";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
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
	services.xserver.enable = false;  # 确保不启动任何桌面环境
  services.openssh.enable = true;  # Enable the OpenSSH daemon.

  # ---- 8. 其他 ----
  programs.nix-ld.enable = true;  # VSCode 的 remotessh 需要

  # 版本号要和自己原本系统中的该属性值一致！！！！
  system.stateVersion = "25.11";  # 永远不要修改这项
}
