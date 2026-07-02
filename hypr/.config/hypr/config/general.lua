------------------------------------------------------------------------
-- 4. GENERAL, LOOK & FEEL, AND INPUT (一般設定、デザイン、入力)
------------------------------------------------------------------------
hl.config({
	-- Render Settings (Performance optimization)
	render = {
		direct_scanout = true,
	},

	-- Cursor settings (Hide cursor when inactive)
	cursor = {
		inactive_timeout = 3,
		no_hardware_cursors = true,
	},

	-- General Settings (Windows layout and Gaps)
	general = {
		gaps_in = 5,
		gaps_out = 10,
		border_size = 2,

		-- Cozy Gruvbox gradient border
		col = {
			active_border = { colors = { "rgba(fe8019ee)", "rgba(fabd2fee)" }, angle = 45 },
			inactive_border = "rgba(504945aa)",
		},

		-- Enable resizing by dragging borders/gaps
		resize_on_border = true,

		-- hyprscrolling layout
		layout = "hyprscrolling",

		-- Allow tearing for low-latency gaming
		allow_tearing = true,
	},

	-- Window Decorations (Rounding, Blur, Shadows)
	decoration = {
		rounding = 12,
		rounding_power = 2,

		-- Modern opacity settings
		active_opacity = 1.0,
		inactive_opacity = 0.94,

		-- Frosted glass blur effect (Optimized for Intel GPU)
		blur = {
			enabled = true,
			size = 6,
			passes = 2,
			vibrancy = 0.1696,
			new_optimizations = true,
			xray = true, -- Drastically reduces GPU rendering overhead when windows overlap
		},

		-- Smooth, natural window shadows
		shadow = {
			enabled = true,
			range = 12,
			render_power = 3,
			color = "rgba(0000003c)",
		},
	},

	-- Dwindle Layout Engine Options
	dwindle = {
		preserve_split = true,
		smart_split = false,
	},

	-- Multitouch Gestures Settings
	gestures = {
		workspace_swipe_distance = 700,
		workspace_swipe_cancel_ratio = 0.2,
		workspace_swipe_min_speed_to_force = 5,
		workspace_swipe_direction_lock = true,
		workspace_swipe_direction_lock_threshold = 10,
		workspace_swipe_create_new = true,
	},

	-- Miscellaneous & System Optimizations
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		vrr = 0, -- Set to 1/2 if monitor supports VRR
		mouse_move_enables_dpms = true,
		key_press_enables_dpms = true,

		-- Window Swallowing (swallows terminal window when launching GUI apps)
		enable_swallow = false,
		swallow_regex = "^(kitty|foot|Alacritty)$",
	},

	-- Input Configuration (Japanese layout)
	input = {
		kb_layout = "jp",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		follow_mouse = 1,
		sensitivity = 0.8, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = true,
			disable_while_typing = true,
			tap_to_click = true,
			clickfinger_behavior = true, -- 2 fingers: Right click, 3 fingers: Middle click
		},
	},

	plugin = {
		hyprscrolling = {
			fullscreen_on_one_column = true,
			column_width = 0.5,
			focus_fit_method = 1,
			follow_focus = true,
			follow_debounce_ms = 0,
			explicit_column_widths = "0.333, 0.5, 0.667, 1.0",
			collapsed_width = 30,
			focus_history = true,
			auto_width_rules = "",
		},
		dynamic_cursors = {
			enabled = true,
			mode = "stretch",
			threshold = 2,

			stretch = {
				limit = 3000,
				activation = "quadratic",
				window = 100,
			},

			shake = {
				enabled = true,
				threshold = 6.0,
				base = 4.0,
				speed = 4.0,
				timeout = 2000,
			},

			hyprcursor = {
				nearest = true,
				enabled = true,
			},
		},

		hyprexpo = {
			columns = 2,
			gaps_in = 5,
			gaps_out = 0,
			bg_col = "rgb(282828)",
			workspace_method = "center current",
			gesture_distance = 200,
			cancel_key = "escape",
			show_cursor = 1,
			tile_rounding = 16,
			tile_rounding_current = 20,
			border_color_current = "rgb(fe8019)",
			border_color_focus = "rgb(fabd2f)",
			skip_empty = 1,
			label_color_current = "rgb(fe8019)",
			label_color_focus = "rgb(fabd2f)",
			keynav_reading_order = 1,
		},
	},
})
