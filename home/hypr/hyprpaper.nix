{ config, pkgs, lib, inputs, ...}:
{
    services.hyprpaper = {
        enable = true;
        settings = {
            ipc = "on";
            splash = true;
            splash_offset = 2.0;

            preload = [ 
              "./Wallpapers/1070343.png"
              "./Wallpapers/742762.png"
            ];

            wallpaper = [
              ", ./Wallpapers/742762.png"
            ];
          };
      };
  }
