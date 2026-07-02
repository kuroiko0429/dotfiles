------------------------------------------------------------------------
-- 5. ANIMATIONS & CURVES (アニメーションと曲線)
------------------------------------------------------------------------
-- Premium smooth bezier curves
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })

-- Configure Leaf Animations
hl.animation({ leaf = "windows", enabled = true, speed = 5.0, bezier = "easeOutQuint", style = "popin 80%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4.0, bezier = "easeInOutCubic", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 8.0, bezier = "easeOutQuint" })
hl.animation({ leaf = "fade", enabled = true, speed = 5.0, bezier = "easeOutQuint" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5.5, bezier = "easeOutQuint", style = "slidevert" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 5.0, bezier = "easeOutQuint", style = "slidevert" })
