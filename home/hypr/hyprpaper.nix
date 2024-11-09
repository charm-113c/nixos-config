{ config, pkgs, lib, inputs, ...}:
{
    services.hyprpaper = {
        enable = true;
        settings = {
            ipc = "on";
            splash = false;
            # splash_offset = 2.0;

            preload = [
              "~/.dotfiles/home/hypr/Wallpapers/1070343.png"
              "~/.dotfiles/home/hypr/Wallpapers/742762.png"
            ];

            wallpaper = [
              ", ~/.dotfiles/home/hypr/Wallpapers/742762.png"
            ];
          };
      };
  }
