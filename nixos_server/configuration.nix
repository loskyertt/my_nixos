# /etc/nixos/configuration.nix

# Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # ---- 1. Boot and System Kernel ----
  boot.loader = {
    efi.canTouchEfiVariables = true;
    # If mounted to /mnt/boot/efi:
    efi.efiSysMountPoint = "/boot/efi";  # The default is “/boot”.
  
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      
      # Theme Configuration
      theme = pkgs.catppuccin-grub.override {
        flavor = "mocha";
      };
    };
  };

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # ---- 2. Network and Firewall ----
  networking.hostName = "nixos"; # Define your hostname.

  networking.networkmanager = {
    enable = true;
    # 如果用的 WIFI，则使用下面这段配置
    # WiFi is automatically configured during system deployment
    ensureProfiles.profiles = {
      "MyHomeWifi" = {
        connection = {
          id = "your_wifi_name";  # WiFi NAME, obtained using `nmcli connection show`
          type = "wifi";
          autoconnect = true;
					permissions = "";  # Ensure that this connection takes effect at the system level and is not bound to a specific user.
        };
        wifi = {
          mode = "infrastructure";
          ssid = "your_wifi_SSID";  # The SSID of the WiFi you are connected to
        };
        wifi-security = {
          auth-alg = "open";
          key-mgmt = "wpa-psk";  # Key management methods: Home Wi-Fi networks almost exclusively use WPA-PSK.
          psk = "your_wifi__secret";  # Your WiFi password
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
  programs.nix-ld.enable = true;  # VSCode 的 remotessh 需要

  # ---- 4. 区域和时钟设置 ----
  time.timeZone = "Asia/Shanghai";
  # time.hardwareClockInLocalTime = true;  # 将 RTC 时间标准设置为本地时间，与 Windows 的默认配置兼容

  # ---- 5. 硬件 ----
  # 设置 swapfile
  swapDevices  =  [{ 
    device  =  "/var/lib/swapfile" ; 
    size  =  16 * 1024 ;  # 16 GB 
  }];

  # 开启图形加速支持
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

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

  # 配置 sudo 显示星号
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
	services.xserver.enable = false;  # 确保不启动任何桌面环境
  services.openssh.enable = true;  # Enable the OpenSSH daemon.

  # ---- 8. 其他 ----
  # 版本号要和自己原本系统中的该属性值一致！！！！
  system.stateVersion = "25.11";  # 永远不要修改这项
}
