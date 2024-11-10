{ config, lib, inputs, ...}:
{
  programs.waybar = {
    enable = true;
    settings = {
        mainBar = {
            layer = "top";
            position = "top";
            height = 30;

            "modules-left" = [
              "hyprland/workspaces"
            ];

            "modules-center" = [ "hyprland/window" ];

            "modules-right" = [
              "idle_inhibitor"
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

            "cpu" = {
                "interval" = 1;
                "format" = "󰍛 {usage}%";
              };

            "memory" = {
                "interval" = 3;
                "format" = "RAM {percentage}% | {used:0.1f}GiB";
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

            "tray" = {
                "icon-size" = 20;
                "spacing" = 10;
              };

          };
      };

    style = ''
    * {
      font-size: 13px;
    }

    window#waybar {
      background-color: rgba(0,0,0,0);
      color: rgba(241, 221, 30, 0.8);
      padding: 5px;
    }

    .modules-left, .modules-center, .modules-right {
      border: 1px solid rgba(39, 230, 255, 0.8);
      border-radius: 15px;
      padding: 0 5 0 5px;
    }

    button {
      border-radius: 15px;
      padding: 0 5px;
      color: rgba(241, 221, 30, 0.8);
    }

    @keyframes blink {
      to {
        background-color: #ffffff;
        color: #000000;
      }
    }
    
    #custom-separator {
      padding: 0 5 0 5px;
      color: rgba(39, 230, 255, 0.5);
    }

    #workspaces button.urgent {
      background-color: rgba(230, 130, 155, 0.2);
    }

    #workspaces button.active {
      background-color: rgba(39, 230, 255, 0.2);
      color: rgb(39, 230, 255);
    }

    #battery {
      border-radius: 15px;
      padding: 0 5 0 5px;
    }

    #battery.charging {
      background-color: rgba(39, 230, 255, 0.2);
      color: rgba(39, 230, 255, 0.8);
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
      background-color: rgba(39, 230, 255, 0.2);
      color: rgb(39, 230, 255);
      padding-right: 4px;
    }
    '';

    };
  }
