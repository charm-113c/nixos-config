{ config, pkgs, lib, inputs, ...}:
{
    services.hyprpaper = {
        enable = true;
        settings = {
            ipc = "on";
            splash = false;
            splash_offset = 2.0;

            preload = [ 
              "/home/charm/Downloads/1070343.png"
            ];

            wallpaper = [
              ", /home/charm/Downloads/1070343.png"
            ];
          };
      };
  }
