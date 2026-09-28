------------------------------------------------------------------------
-- AUTOSTART
-- bar/widget類は起動しない。kitty + tmux運用の最小構成。
------------------------------------------------------------------------
hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

	-- Polkit authentication agent (KDE版は二重起動でhyprpolkitagentとDBus名衝突→SEGVするため削除)
	-- hyprpolkitagentはautostart.lua 21行目のsystemctl --user startで起動

	-- Idle / lock management
	hl.exec_cmd("hypridle")
	-- Notification daemon
	-- hl.exec_cmd("sleep 1 && hyprctl plugin load /home/kuroiko/.config/hypr/plugins/hyprscrolling.so")
	-- hl.exec_cmd("tide-island")
	-- hl.exec_cmd("qs -c Btain_Shell")
	-- Wallpaper (awww)
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("hypridle -c " .. os.getenv("HOME") .. "/.local/src/Brain_Shell/src/config/hypridle.conf")
	hl.exec_cmd("quickshell -c " .. os.getenv("HOME") .. "/.local/src/Brain_Shell")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")

	-- Clipboard history (fuzzel + cliphist で呼び出す)
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

	-- Japanese IME
	hl.exec_cmd("fcitx5 -d --replace")

	hl.exec_cmd("hyprpm reload && hyprctl reload")

	-- hypr-ws daemon: ワークスペース変更イベントを監視して tmux ステータスバーを即時更新
	-- hl.exec_cmd("pkill -f 'hypr-ws -d'; sleep 0.3 && /home/kuroiko/Documents/hypr/hypr-ws -d")
end)
