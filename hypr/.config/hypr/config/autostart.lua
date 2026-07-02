------------------------------------------------------------------------
-- 3. AUTOSTART APPLICATIONS (自動起動)
------------------------------------------------------------------------
hl.on("hyprland.start", function()
	-- Portal settings & DBus synchronization
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("nextcloud --background")
	--hl.exec_cmd("kdeconnectd")
	--hl.exec_cmd("kdeconnect-indicator")
	hl.exec_cmd("hyprpm reload")

	-- Launch Authentication Agent
	hl.exec_cmd(
		"/usr/lib/polkit-kde-authentication-agent-1 || /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
	)
	hl.exec_cmd("quickshell -c /home/kuroiko/.config/quickshell/kuroiko_bar//")
	--hl.exec_cmd("quickshell -c /home/kuroiko/.config/quickshell/android-like/")
	hl.exec_cmd("awww-daemon")
	-- Status bar & Wallpaper & Notifications
	hl.exec_cmd("dunst || swaync")

	-- Input Method Daemon
	hl.exec_cmd("fcitx5 -d --replace")

	-- Screen Idle & Lock Management
	hl.exec_cmd("hypridle")

	-- Clipboard manager (cliphist)
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

	-- Load hyprscrolling plugin with delay
	hl.exec_cmd("sleep 1 && hyprctl plugin load /home/kuroiko/.config/hypr/plugins/hyprscrolling/hyprscrolling.so")
	--hl.exec_cmd("wayvnc 0.0.0.0 5900")
end)
