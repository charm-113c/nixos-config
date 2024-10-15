{ config, pkgs, inputs, ... }:
# let
#   hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
# in 
{
    programs.waybar.enable = true;

    wayland.windowManager.hyprland = {
        enable = true;

        # plugins = [
        #   inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.
        # ];
        # set the flake package 

        settings = {
            env = [
              "LIBVA_DRIVER_NAME, nvidia"
              "XDG_SESSION_TYPE, wayland"
              "GBM_BACKEND, nvidia-drm"
              "__GLX_VENDOR_LIBRARY_NAME, nvidia"
              "AQ_DRM_DEVICES, /dev/dri/card1:/dev/dri/card0"
              "NIXOS_OZONE_WL, 1"
            ];

            cursor = { 
                no_hardware_cursors = true;
              };

            general = {
                border_size = 1;
                gaps_in = 5;
                gaps_out = 5;
                "col.inactive_border" = "rgb(27e6ff)";
                "col.active_border" = "rgba(27e6ff4d)";
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
              "Super, mouse_down, workspace, e-1"
              "Super, mouse_up, workspace, e+1"
              "Super, Q, exec, alacritty"
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
            ];
          };
      };
  }
