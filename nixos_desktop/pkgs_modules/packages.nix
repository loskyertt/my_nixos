# /etc/nixos/pkgs_modules/packages.nix
{ config, lib, pkgs, ... }: 

{
  # ---- 1. 系统软件包 ----
  environment.systemPackages = [
    pkgs.vim
    pkgs.git
    pkgs.wget
    pkgs.bat
    pkgs.fastfetch
    pkgs.starship  # 终端美化
    pkgs.ghostty  # 终端
    pkgs.btop  # CLI 资源监视
    pkgs.google-chrome
    pkgs.vscode
    pkgs.mission-center  # 资源监视

    # ---- GStreamer 插件（多媒体库）----
    pkgs.gst_all_1.gst-plugins-base
    pkgs.gst_all_1.gst-plugins-good
    pkgs.gst_all_1.gst-plugins-bad
    pkgs.gst_all_1.gst-plugins-ugly
  ];

  # 启用 firefox
  # programs.firefox.enable = true;

  # ---- 2. direnv 配置 ----
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # ---- 3. docker 配置 ----
  virtualisation.docker = {
    enable = true;  # 启用 Docker 守护进程
    # package = pkgs.docker_28;  # 指定安装版本，默认是最新版
  };

  # ---- 4. zsh 配置 ----
  programs.zsh = {
    enable = true;  # 启用自动建议
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;  # 启用语法高亮
  };

  # 设置默认 Shell (用户名：sky)
  users.users.sky.shell = pkgs.zsh;

  # ---- 5. flatpak 配置 ----
  # services.flatpak.enable = true;   # 启用 flatpak
  # systemd.services.flatpak-repo = {  # 设置系统级软件的仓库
  #   wantedBy = [ "multi-user.target" ];
  #   path = [ pkgs.flatpak ];
  #   script = ''
  #     flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  #   '';
  # };
  # 让 GNOME 认得 Flatpak 的图标
  # environment.extraInit = ''
  #   [[ -d ~/.local/share/flatpak/exports/share ]] && export XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/.local/share/flatpak/exports/share"
  #   export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share"
  # '';
}
