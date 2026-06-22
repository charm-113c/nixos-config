-- Env vars
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("AQ_DRM_DEVICES", "/dev/dri/card1:/dev/dri/card0")
hl.env("NIXOS_OZONE_WL", "1")

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("/home/charm/.dotfiles/home/scripts/wallpaper.sh")
	hl.exec_cmd("fcitx5")
end)

hl.monitor({ output = "eDP-1", mode = "1920x1080", position = "0x0", scale = 1 })
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080", position = "1920x0", scale = 1 })

hl.workspace_rule({ workspace = "1", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "2", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "3", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "4", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "5", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "6", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "7", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "8", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "9", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "10", monitor = "HDMI-A-1", persistent = true })

active_col = "rgb(27e6ff)"
inactive_col = "rgba(27e6ff4d)"
tab_active_col = "rgba(ff0000c8)"
tab_inactive_col = "rgba(00000088)"

hl.config({
	general = {
		border_size = 1,
		gaps_in = 5,
		gaps_out = 5,
		col = {
			active_border = active_col,
			inactive_border = inactive_col,
		},
		resize_on_border = true,
		extend_border_grab_area = 30,

		snap = {
			enabled = true,
		},
	},

	decoration = {
		rounding = 10,
		inactive_opacity = 0.8,

		blur = {
			enabled = false,
		},

		glow = {
			enabled = true,
		},

		motion_blur = {
			enabled = true,
		},
	},

	animations = {
		enabled = true,
		workspace_wraparound = true,
	},

	input = {
		kb_model = "pc104",
		kb_layout = "it",
	},

	group = {
		col = {
			-- active = tab_active_col,
			-- inactive = tab_inactive_col,
			border_active = tab_active_col,
			border_inactive = "rgba(ff000088)",
		},

		groupbar = {
			font_family = "Hurmit Nerd Font",
			font_size = 12,
		},
	},

	misc = {
		animate_manual_resizes = true,
		on_focus_under_fullscreen = 2,
	},
})

hl.window_rule({ match = { class = "Arma 3" }, confine_pointer = true })

hl.bind("SUPER + W", hl.dsp.exec_cmd("vivaldi"))
hl.bind("SUPER + F", hl.dsp.exec_cmd("thunar"))
hl.bind("SUPER + Q", hl.dsp.exec_cmd("kitty --title 'TF Euler - \"Sine Pari\"'"))
hl.bind("SUPER + P", hl.dsp.exec_cmd("focuswriter"))
hl.bind("SUPER + A", hl.dsp.exec_cmd('rofi -show combi -combi-modes "window,drun" -modes'))

hl.bind("SUPER + BACKSPACE", hl.dsp.window.close({ window = "activewindow" }))
hl.bind("SUPER + T", hl.dsp.group.toggle({ window = "activewindow" }))

hl.bind("F3", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"), { repeating = true })
hl.bind("F4", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"), { repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+"), { repeating = true })
hl.bind("F7", hl.dsp.exec_cmd("brightnessctl set 5%-"), { repeating = true })
hl.bind("F8", hl.dsp.exec_cmd("brightnessctl set 5%+"), { repeating = true })
--
-- Screenshot a region and save it to Screenshots
hl.bind("SUPER + F5", hl.dsp.exec_cmd("hyprshot -n region -o ~/Pictures/Screenshots"))
-- Screenshot a monitor and save it to Screenshots
hl.bind("SUPER + F6", hl.dsp.exec_cmd("hyprshot -n output -o ~/Pictures/Screenshots"))
-- Copy screen pixel colour to clipboard
hl.bind("SUPER + F9", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind("SUPER + F10", hl.dsp.exec_cmd("~/.dotfiles/home/scripts/wallpaper.sh"))
hl.bind("SUPER + F11", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle", window = "activewindow" }))

hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("F1", hl.dsp.exec_cmd("playerctl next"))
hl.bind("F2", hl.dsp.exec_cmd("playerctl previous"))

hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1, on_current_monitor = false }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2, on_current_monitor = false }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3, on_current_monitor = false }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4, on_current_monitor = false }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5, on_current_monitor = false }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6, on_current_monitor = false }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = 7, on_current_monitor = false }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = 8, on_current_monitor = false }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = 9, on_current_monitor = false }))
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10, on_current_monitor = false }))

for i = 1, 10 do
	hl.bind("SUPER + SHIFT + " .. (i % 10), function()
		hl.dispatch(hl.dsp.window.move({ workspace = i, follow = true }))
	end, { description = "Window: Send to workspace " .. i })
end

hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "d" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" }))

hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ into_group = "l" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ into_group = "r" }))
hl.bind("SUPER + ALT + H", hl.dsp.window.move({ out_of_group = "l" }))
hl.bind("SUPER + ALT + L", hl.dsp.window.move({ out_of_group = "r" }))

hl.bind("SUPER + CONTROL + H", hl.dsp.group.prev({ window = "activewindow" }))
hl.bind("SUPER + CONTROL + L", hl.dsp.group.next({ window = "activewindow" }))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())
