------------------------------------------------------------------------
-- WINDOW RULES
------------------------------------------------------------------------
hl.window_rule({ match = { class = "^(pavucontrol)$" }, float = true })
hl.window_rule({ match = { class = "^(nm-connection-editor)$" }, float = true })

-- Ignore maximize requests from all apps
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- Fcitx5 (IME) candidate window focus prevention
hl.window_rule({ match = { class = "^(fcitx)$" }, no_focus = true })

-- File dialogs
hl.window_rule({ match = { title = "^(Open File)(.*)$" }, float = true, center = true })
hl.window_rule({ match = { title = "^(Select a File)(.*)$" }, float = true, center = true })
hl.window_rule({ match = { title = "^(Save As)(.*)$" }, float = true, center = true })

-- Fix some dragging issues with XWayland
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

hl.window_rule({
	name = "Whisp-float",
	match = { class = "^io.github.tanaybhomia.Whisp$" },
	size = { 700, 700 },
	float = true,
})

hl.window_rule({
	name = "gpclient-float",
	match = { class = "^gpauth$" },
	size = { 500, 900 },
	float = true,
})

hl.window_rule({
	name = "zotero-float",
	match = { class = "^Zotero$" },
	size = { 900, 1000 },
	float = true,
})
