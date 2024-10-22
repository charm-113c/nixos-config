{ config, pkgs, lib, inputs, ...}:
{
    wayland.windowManager.hyprland = {
      enable = true;

      # plugins = [
      #   inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
      #   inputs.hyprland-plugins.packages.${pkgs.system}.hyprwinwrap
      #   inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
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
            # "${pkgs.hyprpanel}/bin/hyprpanel"
            "hyprpanel"
          ];
          
          # Manually "extend" monitors instead of 
          # each haing its own workspace
          monitor = [
              "eDP-1, 1920x1080@60, 0x0, 1"
              "HDMI-A-1, 1920x1080@60, 1920x0, 1"
            ];

          # Bind workspaces to monitors
          workspace = [
              "0, monitor:eDP-1"
              "1, monitor:eDP-1"
              "2, monitor:eDP-1"
              "3, monitor:eDP-1"
              "4, monitor:eDP-1"

              "5, monitor:HDMI-A-1"
              "6, monitor:HDMI-A-1"
              "7, monitor:HDMI-A-1"
              "8, monitor:HDMI-A-1"
              "9, monitor:HDMI-A-1"

          ];

          cursor = { 
              no_hardware_cursors = true;
            };

          general = {
              border_size = 1;
              gaps_in = 5;
              gaps_out = 5;
              "col.active_border" = "rgb(27e6ff)";
              "col.inactive_border" = "rgba(27e6ff4d)";
              resize_on_border = true;
            };

          decoration = {
              rounding = 10;
              inactive_opacity = 0.8;

              # shadow stuff
              drop_shadow = true;
              shadow_range = 10;
              "col.shadow" = "rgba(00000080)";

              blur = {
                  enabled = true;
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

          # misc = {
              # font_family = "";
            # };

          bind = [
            "Super, W, exec, firefox"
            "Super, F, exec, focuswriter"
            "Super, Q, exec, alacritty"
            "Super, BackSpace, killactive"
            "Super, F11, fullscreen"

            "Super, 1, workspace, 1"
            "Super, 2, workspace, 2"
            "Super, 3, workspace, 3"
            "Super, 4, workspace, 4"
            "Super, 5, workspace, 5"
            "Super, 6, workspace, 6"
            "Super, 7, workspace, 7"
            "Super, 8, workspace, 8"
            "Super, 9, workspace, 9"
            "Super, 0, workspace, 0"
            "Super, mouse_down, workspace, e-1"
            "Super, mouse_up, workspace, e+1"

            "Control+Super, right, workspace, +1"
            "Control+Super, left, workspace, -1"

            "Super+Shift, H, movewindow, l"
            "Super+Shift, L, movewindow, r"
            "Super+Shift, K, movewindow, u"
            "Super+Shift, J, movewindow, d"
            "Super, H, movefocus, l"
            "Super, L, movefocus, r"
            "Super, K, movefocus, u"
            "Super, J, movefocus, d"

          ];

          bindel = [
            ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
            ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ];

          bindl = [
              ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
              ", XF86AudioPlay, exec, playerctl play-pause"
              ", XF86AudioNext, exec, playerctl next"
          ];
        };
    };
  }
