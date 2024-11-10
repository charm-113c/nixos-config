{ inputs, pkgs, ... }:
{
    services.hypridle = {
        enable = true;
        settings = {
            general = {
                lock_cmd = "pidof hyprlock || hyprlock";
                before_sleep_cmd = "hyprlock";
                after_sleep_cmd = "hyprctl dispatch dpms on"; # Avoid having to press keys twice to turn screen on
              };

            listener = [
              {
                  timeout = 300; # 5mn
                  on-timeout = "hyprlock";
                }

              {
                  timeout = 330; # 5.5mn
                  on-timeout = "hyprctl dispatch dpms off"; # screen off
                  on-resume = "hyprctl dispatch dpms on"; # screen on
                }

              {
                  timeout = 600; # 10mn
                  on-timeout = "systemctl suspend";
                }
            ];
          };
      };
  }
