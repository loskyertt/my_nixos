# /etc/nixos/pkgs_modules/flatpak.nix
{ config, lib, pkgs, ... }: 

{
  services.flatpak.enable = true;   # 启用 flatpak

  # 设置系统级软件的仓库
  systemd.services.flatpak-repo = {  
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
  # 让 GNOME 认得 Flatpak 的图标
  environment.extraInit = ''
    [[ -d ~/.local/share/flatpak/exports/share ]] && export XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/.local/share/flatpak/exports/share"
    export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share"
  '';
}
