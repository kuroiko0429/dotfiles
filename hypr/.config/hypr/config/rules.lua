------------------------------------------------------------------------
-- 7. WINDOW RULES (ウィンドウ・レイヤールール)
------------------------------------------------------------------------
-- Auto-float specific system windows
hl.window_rule({ match = { class = "^(pavucontrol)$" }, float = true })
hl.window_rule({ match = { class = "^(nm-connection-editor)$" }, float = true })
hl.window_rule({ match = { class = "^([zZ]otero)$" }, float = true })

-- Fcitx5 (IME) candidate window focus prevention
hl.window_rule({ match = { class = "^(fcitx)$" }, no_focus = true })

-- File dialogs
hl.window_rule({ match = { title = "^(Open File)(.*)$" }, float = true, center = true })
hl.window_rule({ match = { title = "^(Select a File)(.*)$" }, float = true, center = true })
hl.window_rule({ match = { title = "^(Save As)(.*)$" }, float = true, center = true })
hl.window_rule({ match = { title = "^(Choose wallpaper)(.*)$" }, float = true, center = true })
hl.window_rule({ match = { title = "^(GlobalProtect Login)(.*)$" }, float = true, center = true })

-- Layer rules for Dunst/SwayNC notifications and Waybar (enable blur)
hl.layer_rule({ match = { namespace = "notifications" }, blur = true, ignore_alpha = 0.6 })
hl.layer_rule({ match = { namespace = "waybar" }, blur = true, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "quickshell:conky" }, blur = true, ignore_alpha = 0.2 })
hl.layer_rule({ match = { namespace = "quickshell" }, blur = true, ignore_alpha = 0.2 })
