------------------------------------------------------------------------
-- AUTOSTART
-- bar/widget類は起動しない。kitty + tmux運用の最小構成。
------------------------------------------------------------------------
hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

	-- Polkit authentication agent
	hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")

	-- Idle / lock management
	hl.exec_cmd("hypridle")

	-- Notification daemon
	hl.exec_cmd("sleep 1 && hyprctl plugin load /home/kuroiko/.config/hypr/plugins/hyprscrolling.so")
	-- hl.exec_cmd("tide-island")
	-- hl.exec_cmd("qs -c m3-shell")
	-- Wallpaper (awww)
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("sleep 1 && awww img /home/kuroiko/Pictures/Wallpapers/snake.png")

	-- Clipboard history (fuzzel + cliphist で呼び出す)
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

	-- Japanese IME
	hl.exec_cmd("fcitx5 -d --replace")

	-- hypr-ws daemon: ワークスペース変更イベントを監視して tmux ステータスバーを即時更新
	hl.exec_cmd("pkill -f 'hypr-ws -d'; sleep 0.3 && /home/kuroiko/Documents/hypr/hypr-ws -d")
end)
