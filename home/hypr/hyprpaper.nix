{ config, pkgs, lib, inputs, ...}:
{
    services.hyprpaper = {
        enable = true;
        settings = {
            ipc = "on";
            splash = false;
            # splash_offset = 2.0;

            # Randomly load wallpaper in shell script
            # preload = [
              # "~/.dotfiles/home/hypr/Wallpapers/1070343.png"
              # "~/.dotfiles/home/hypr/Wallpapers/742762.png"
              # "~/.dotfiles/home/hypr/Wallpapers/bioluminescence-5120x2880-15292.jpg"
              # "~/.dotfiles/home/hypr/Wallpapers/1075301.png"
              # "~/.dotfiles/home/hypr/Wallpapers/Heaven Piercer.jpg"
              # "~/.dotfiles/home/hypr/Wallpapers/436854.jpg"
              # "~/.dotfiles/home/hypr/Wallpapers/Space Travel.jpg"
            # ];

            # wallpaper = [
            #   ", ~/.dotfiles/home/hypr/Wallpapers/1075301.png"
            # ];

            # unload = [
              # "~/.dotfiles/home/hypr/Wallpapers/1070343.png"
              # "~/.dotfiles/home/hypr/Wallpapers/742762.png"
              # "~/.dotfiles/home/hypr/Wallpapers/bioluminescence-5120x2880-15292.jpg"
              # ", ~/.dotfiles/home/hypr/Wallpapers/1075301.png"
            # ];
          };
      };
  }
