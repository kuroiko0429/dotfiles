------------------------------------------------------------------------
-- MONITORS (Let's Note CF-SV1 + 外部モニター HDMI-A-1)
------------------------------------------------------------------------
hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "0x0",
	scale = 1,
})

-- HDMI-A-1 (3840x2160, scale 1.5 -> 論理解像度2560x1440) をeDP-1の真上に配置
hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@165",
	position = "0x-1080",
	scale = 1,
})
