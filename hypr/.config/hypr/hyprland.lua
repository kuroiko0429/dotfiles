-- =====================================================================
--  CachyOS / Arch Linux - Optimal Hyprland Lua Configuration
--  File: ~/.config/hypr/hyprland.lua (Modular Configuration)
-- =====================================================================

-- Add the configuration directory to package.path to ensure modules can be imported
local home = os.getenv("HOME") or "/home/kuroiko"
local config_dir = home .. "/.config/hypr"
package.path = config_dir .. "/?.lua;" .. config_dir .. "/?/init.lua;" .. package.path

-- Import configuration modules
require("config.monitors")
require("config.env")
require("config.autostart")
require("config.general")
require("config.animations")
require("config.binds")
require("config.rules")
