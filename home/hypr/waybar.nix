{ config, lib, pkgs, inputs, ...}:
let
  # primary_col = "rgb(39, 230, 255)";
  primary_col = "rgb(53, 231, 244)";
  primary_shade = "rgba(53, 231, 244, 0.2)";
  primary_shade_med = "rgba(53, 231, 244, 0.5)";
  primary_shade_bold = "rgba(53, 231, 244, 0.8)";
  # second_col = "rgb(241, 221, 30)";
  # second_col = "rgb(255, 47, 208)";
  second_col = "rgb(255, 0, 0)";
  second_shade = "rgba(255, 0, 0, 0.2)";
  second_shade_med = "rgba(255, 0, 0, 0.5)";
  second_shade_bold = "rgba(255, 0, 0, 0.8)";
in
{
  programs.waybar = {
    enable = true;
    settings = {
        mainBar = {
            layer = "top";
            position = "top";
            # height = 30;

            "modules-left" = [
              "custom/power_menu"
              "hyprland/workspaces"
            ];

            "modules-center" = [ 
              "hyprland/window"
            ];

            "modules-right" = [
              "idle_inhibitor"
              "custom/separator"
              "bluetooth"
              "custom/separator"
              "cpu"
              "custom/separator"
              "memory"
              "custom/separator"
              "battery"
              "custom/separator"
              "pulseaudio"
              "custom/separator"
              "clock"
              "custom/separator"
              "tray"
            ];

            "custom/power_menu" = {
                "format" = " ";
                "on-click" = "~/.dotfiles/home/scripts/pmenu.sh";
              };

            "hyprland/window" = {
                "separate-outputs"= true;
              };

            "custom/separator" = {
                "format"= "♦";
              };

            "idle_inhibitor"= {
              "format"= "{icon}";
              "format-icons"= {
                "activated"= " ";
                "deactivated"= " ";
              };
              "timeout"= 30;
            };
            
            "bluetooth" = {
                "on-click" = "kitty -e bluetoothctl";
              };

            "cpu" = {
                "interval" = 1;
                "format" = "󰍛  {usage}%";
                "on-click" = "kitty -e btop";
              };

            "memory" = {
                "interval" = 3;
                "format" = "RAM {percentage}% | {used:0.1f}GiB";
                "on-click" = "kitty -e btop";
              };

            "pulseaudio" = {
                "scroll-step" = 1;
                "format" = "{icon} {volume}%";
                "format-muted" = "󰖁 Muted";
                "format-icons" = {
                  "default" = [ " " " " " " ];
                };
                # "on-click" = "pamixer -t";
                # "tooltip" = false;
              };

            "battery"= {
              "states"= {
                "good"= 70;
                "warning"= 30;
                "critical"= 20;
              };
              "format"= "{icon} {capacity}%";
              "format-icons"= [
                  " "
                  " "
                  " "
                  " "
                  " "
                ];
              };

            "clock" = {
              "tooltip-format" = "<tt><small>{calendar}</small></tt>";
            };

            "tray" = {
                "icon-size" = 20;
                "spacing" = 10;
              };

          };
      };

    style = ''
    * {
      font-size: 14px;
      /* font-family: Monaco, Consolas, monospace, Roboto; */
    }

    window#waybar {
      background-color: rgba(0,0,0,0);
      /* color: rgba(241, 221, 30, 0.8); */
      color: white;
      padding: 5px;
      text-shadow: 0px 0px 5px ${second_col};
    }

    #custom-power_menu, #workspaces, .modules-center, .modules-right {
      border: 1px solid ${primary_shade_bold};
      border-radius: 15px;
      padding:  1px 5px 1px 5px;
      background-color: rgba(0,0,0,0.7);
    }

    button {
      border-radius: 15px;
      padding: 0px 5px;
      color: white;
      text-shadow: 0px 0px 5px ${second_col};
    }

    @keyframes blink {
      to {
        background-color: #ffffff;
        color: #000000;
      }
    }

    #custom-power_menu {
      font-size: 19px;
      padding: 0px 0px 0px 5px;
      color: ${primary_col};
      border-radius: 50px;
      margin-right: 5px;
      text-shadow: 0px 0px 5px ${second_col};
    }

    #custom-separator {
      padding:  0px 5px 0px 5px;
      color: ${primary_shade_med};
    }

    #workspaces button.urgent {
      background-color: rgba(230, 130, 155, 0.2);
    }

    #workspaces button.active {
      background-color: ${primary_shade};
      color: ${primary_shade_bold};
      text-shadow: 0px 0px 5px ${primary_col};
    }

    #memory:hover, #cpu:hover, #bluetooth:hover {
      background-color: ${primary_shade};
      color: ${primary_shade_bold};
      border-radius: 15px;
      padding: 0px 5px 0px 5px;
      text-shadow: 0px 0px 5px ${primary_col};
    }

    #battery {
      border-radius: 15px;
      padding:  0px 5px 0px 5px;
    }

    #battery.charging {
      background-color: ${primary_shade};
      color: ${primary_col};
      text-shadow: 0px 0px 5px ${primary_col};
    }

    #battery.critical:not(.charging) {
      background-color: rgba(230, 130, 155, 0.2);
      color: rgb(230, 130, 155);
      animation-name: blink;
      animation-duration: 0.5s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
    }

    label:focus {
      background-color: #000000;
    }

    #tray > .passive {
      -gtk-icon-effect: dim;
    }

    #tray > .needs-attention {
      -gtk-icon-effect: highlight;
      background-color: #eb4d4b;
    }

    #idle_inhibitor {
      border-radius: 15px;
      padding-left: 5px;
    }

    #idle_inhibitor.activated {
      background-color: ${primary_shade};
      color: ${primary_shade_bold};
      padding-right: 4px;
      text-shadow: 0px 0px 5px ${primary_col};
    }
    '';

    };
  }
