{ config, pkgs, lib, inputs, ...}:
let
  active_col = "rgb(27e6ff)";
  inactive_col = "rgba(27e6ff4d)";
in 
{
    wayland.windowManager.hyprland = {
      enable = true;

      # plugins = with inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}; [
      #   hyprpaper
      # ];

      settings = {
          env = [
            "LIBVA_DRIVER_NAME, nvidia"
            "XDG_SESSION_TYPE, wayland"
            "GBM_BACKEND, nvidia-drm"
            "__GLX_VENDOR_LIBRARY_NAME, nvidia"
            "AQ_DRM_DEVICES, /dev/dri/card1:/dev/dri/card0"
            "NIXOS_OZONE_WL, 1"
          ];

          exec-once = [
            "waybar"
            "hyprpaper"
            "/home/charm/.dotfiles/home/scripts/wallpaper.sh >> ~/templog.log"
            "fcitx5"
          ];

          monitor = [
              "eDP-1, 1920x1080@60, 0x0, 1"
              "HDMI-A-1, 1920x1080@60, 1920x0, 1"
            ];

          # Bind workspaces to monitors
          workspace = [
              "1, monitor:eDP-1, persistent:true"
              "2, monitor:eDP-1, persistent:true"
              "3, monitor:eDP-1, persistent:true"
              "4, monitor:eDP-1, persistent:true"
              "5, monitor:eDP-1, persistent:true"

              "6, monitor:HDMI-A-1, persistent:true"
              "7, monitor:HDMI-A-1, persistent:true"
              "8, monitor:HDMI-A-1, persistent:true"
              "9, monitor:HDMI-A-1, persistent:true"
              "10, monitor:HDMI-A-1, persistent:true"
          ];

          cursor = {
              no_hardware_cursors = true;
            };

          general = {
              border_size = 1;
              gaps_in = 5;
              gaps_out = 5;
              "col.active_border" = active_col;
              "col.inactive_border" = inactive_col;
              resize_on_border = true;
              extend_border_grab_area = 30;
            };

          decoration = {
              rounding = 10;
              inactive_opacity = 0.8;

              # shadow stuff # Moved to shadow = {}; subcategory
              # drop_shadow = true;
              # shadow_range = 10;
              # "col.shadow" = "rgba(00000080)";

              blur = {
                  enabled = true;
                  size = 4;
                  new_optimizations = true;
                  xray = true;
                };
            };

          animations = {
              enabled = true;
              # lots of things to explore here, learn as you go
            };

          input = {
              kb_model = "pc104";
              kb_layout = "it";
              numlock_by_default = true;
            };

          # windowrulev2 = [
          #   "pseudo, class:(.*)"
          # ];

          # misc = {
              # font_family = "";
            # };

          bind = [
            "Super, W, exec, firefox"
            "Super, F, exec, thunar"
            "Super, Q, exec, kitty"
            "Super, A, exec, anyrun"
            "Super, BackSpace, killactive"
            "Super, F11, fullscreen"

            # Screenshots
            "Super, F5, exec, hyprshot -m window -o ~/Pictures/Screenshots/" # window
            "Super, F6, exec, hyprshot -m output -o ~/Pictures/Screenshots/" # monitor

            "Super, 1, workspace, 1"
            "Super, 2, workspace, 2"
            "Super, 3, workspace, 3"
            "Super, 4, workspace, 4"
            "Super, 5, workspace, 5"
            "Super, 6, workspace, 6"
            "Super, 7, workspace, 7"
            "Super, 8, workspace, 8"
            "Super, 9, workspace, 9"
            "Super, 0, workspace, 10"
            "Super, mouse_down, workspace, e-1"
            "Super, mouse_up, workspace, e+1"

            "Control+Super, L, workspace, +1"
            "Control+Super, H, workspace, -1"

            "Super+Shift, H, movewindow, l"
            "Super+Shift, L, movewindow, r"
            "Super+Shift, K, movewindow, u"
            "Super+Shift, J, movewindow, d"
            "Super, H, movefocus, l"
            "Super, L, movefocus, r"
            "Super, K, movefocus, u"
            "Super, J, movefocus, d"

            "Super+Shift, 0, movetoworkspace, 0"
            "Super+Shift, 1, movetoworkspace, 1"
            "Super+Shift, 2, movetoworkspace, 2"
            "Super+Shift, 3, movetoworkspace, 3"
            "Super+Shift, 4, movetoworkspace, 4"
            "Super+Shift, 5, movetoworkspace, 5"
            "Super+Shift, 6, movetoworkspace, 6"
            "Super+Shift, 7, movetoworkspace, 7"
            "Super+Shift, 8, movetoworkspace, 8"
            "Super+Shift, 9, movetoworkspace, 9"

            "Super, M, togglefloating"
          ];

          bindel = [
            ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+"
            ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"
            ", F3, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"
            ", F4, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+"

            ", F7, exec, brightnessctl set 5%-"
            ", F8, exec, brightnessctl set +5%"

            "Super+Alt, L, resizeactive, 10 0"
            "Super+Alt, K, resizeactive, 0 -10"
            "Super+Alt, J, resizeactive, 0 10"
            "Super+Alt, H, resizeactive, -10 0"

            "Super, left, moveactive, -10 0"
            "Super, right, moveactive, 10 0"
            "Super, up, moveactive, 0 -10"
            "Super, down, moveactive, 0 10"
          ];

          bindl = [
              ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
              ", XF86AudioPlay, exec, playerctl play-pause"
              ", XF86AudioNext, exec, playerctl next"
          ];

	  bindm = [
		"Super, mouse:272, movewindow"
		"Super, mouse:273, resizewindow"
	  ];
        };
    };
  }
