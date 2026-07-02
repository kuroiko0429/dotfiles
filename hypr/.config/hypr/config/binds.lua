------------------------------------------------------------------------
-- 6. KEYBINDINGS (キーバインド)
------------------------------------------------------------------------
local mainMod = "SUPER"

-- Core Commands
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd("kitty tmux"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("nautilus"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("qs -c kuroiko_bar ipc call appLauncher toggle"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("google-chrome-stable || zen-browser || firefox"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("qs -c kuroiko_bar ipc call clipboardSelector toggle"))

-- Hyprexpo (workspace overview)
hl.bind(mainMod .. " + TAB", function()
	hl.plugin.hyprexpo.expo("toggle")
end)
hl.bind(mainMod .. " + ALT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("hyprctl dispatch exit"))
hl.bind(mainMod .. " + ALT + SPACE", hl.dsp.window.float({ action = "toggle" }))

-- Quickshell Custom IPC Keybinds
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("qs -c kuroiko_bar ipc call powermenu toggle"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("qs -c kuroiko_bar ipc call wallpaperSelector toggle"))

-- Navigation & Window Focus (Arrow Keys)
hl.bind(mainMod .. " + Left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "r" }))

-- Workspace Switching (Relative)
hl.bind(mainMod .. " + Up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + Down", hl.dsp.focus({ workspace = "e+1" }))
--hl.bind(mainMod .. " + K", hl.dsp.focus({ workspace = "e-1" }))
--hl.bind(mainMod .. " + J", hl.dsp.focus({ workspace = "e+1" }))

-- Window Movement (Swap positions)
hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + Up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.window.move({ direction = "d" }))

-- Workspace Switching & Window Send (1-10)
for i = 1, 9 do
	-- SUPER + [1-9] to switch workspace
	hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = tostring(i) }))
	-- SUPER + SHIFT + [1-9] to move window to workspace
	hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = tostring(i), follow = false }))
end
-- 10th Workspace
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = "10" }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "10", follow = false }))

-- Special Workspace (Scratchpad / Drop-down terminal equivalent)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("special"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:special", follow = false }))

-- Mouse Keybinds (Moving and Resizing windows)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Hardware / Media Keys (Requires wireplumber/brightnessctl)
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })

------------------------------------------------------------------------
-- Hyprscrolling Layout Keybindings
------------------------------------------------------------------------
-- Focus movement
hl.bind(mainMod .. " + H", hl.dsp.layout("focus l"))
hl.bind(mainMod .. " + L", hl.dsp.layout("focus r"))
hl.bind(mainMod .. " + K", hl.dsp.layout("focus u"))
hl.bind(mainMod .. " + J", hl.dsp.layout("focus d"))
hl.bind(mainMod .. " + CTRL + mouse_down", hl.dsp.layout("cyclenext"))
hl.bind(mainMod .. " + CTRL + mouse_up", hl.dsp.layout("cyclenext prev"))

-- Window movement
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.layout("movewindowto l"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.layout("movewindowto r"))
hl.bind(mainMod .. " + CTRL + SHIFT + L", hl.dsp.exec_cmd("bash /home/kuroiko/.config/quickshell/kuroiko_bar/lock.sh"))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.layout("movewindowto u"))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.layout("movewindowto d"))
hl.bind(mainMod .. " + P", hl.dsp.layout("promote"))

-- Column operations
hl.bind(mainMod .. " + ALT + H", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + ALT + L", hl.dsp.layout("swapcol r"))
hl.bind(mainMod .. " + asciicircum", hl.dsp.layout("colresize +0.05"))
hl.bind(mainMod .. " + minus", hl.dsp.layout("colresize -0.05"))
hl.bind(mainMod .. " + bracketright", hl.dsp.layout("colresize +conf"))
hl.bind(mainMod .. " + bracketleft", hl.dsp.layout("colresize -conf"))
hl.bind(mainMod .. " + SHIFT + equal", hl.dsp.layout("colresize all 0.5"))

-- View scrolling
hl.bind(mainMod .. " + period", hl.dsp.layout("move +col"))
hl.bind(mainMod .. " + comma", hl.dsp.layout("move -col"))
hl.bind(mainMod .. " + SHIFT + period", hl.dsp.layout("move +200"))
hl.bind(mainMod .. " + SHIFT + comma", hl.dsp.layout("move -200"))

-- Fit operations
hl.bind(mainMod .. " + F", hl.dsp.layout("fit active"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.layout("fit visible"))
hl.bind(mainMod .. " + CTRL + F", hl.dsp.layout("fit all"))
hl.bind(mainMod .. " + T", hl.dsp.layout("togglefit"))

-- Column pinning
hl.bind(mainMod .. " + CTRL + bracketleft", hl.dsp.layout("pin left"))
hl.bind(mainMod .. " + CTRL + bracketright", hl.dsp.layout("pin right"))
hl.bind(mainMod .. " + CTRL + backslash", hl.dsp.layout("unpin"))

-- Column workspace movement
for i = 1, 5 do
	hl.bind(mainMod .. " + CTRL + SHIFT + " .. i, hl.dsp.layout("movecoltoworkspace " .. i))
end
hl.bind(mainMod .. " + CTRL + SHIFT + right", hl.dsp.layout("movecoltoworkspace +1"))
hl.bind(mainMod .. " + CTRL + SHIFT + left", hl.dsp.layout("movecoltoworkspace -1"))
hl.bind(mainMod .. " + CTRL + SHIFT + S", hl.dsp.layout("movecoltoworkspace special"))

-- Column collapse
hl.bind(mainMod .. " + C", hl.dsp.layout("togglecollapse"))

-- Zen mode
hl.bind(mainMod .. " + Z", hl.dsp.layout("zen"))

-- Focus history
hl.bind(mainMod .. " + ALT + bracketleft", hl.dsp.layout("focusback"))
hl.bind(mainMod .. " + ALT + bracketright", hl.dsp.layout("focusfwd"))
