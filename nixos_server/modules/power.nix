# /etc/nixos/modules/power.nix
{ config, lib, pkgs, ... }: 

{
	# 完全禁用挂起功能
	systemd.sleep.extraConfig = ''
		AllowSuspend=no
		AllowHibernation=no
		AllowHybridSleep=no
		AllowSuspendThenHibernate=no
	'';

	services.power-profiles-daemon.enable = true;
}