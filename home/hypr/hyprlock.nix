{ inputs, pkgs, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
          path = "~/.dotfiles/home/hypr/Wallpapers/Heaven Piercer.jpg";
# "~/.dotfiles/home/hypr/Wallpapers/bioluminescence-5120x2880-15292.jpg";
          blur_passes = 1;
          blur_size = 4;
          grace = 20; # period in s after lock where mouse movement unlocks automatically
        };

      label = [
        {
          # Clock module
          text = "$TIME";
          halign = "center";
          valign = "center";
          position = "0, 200";
          font_size = 40;
          }

        {
          # Message module
          text = "心の声はちゃんと聴いてね。";
          halign = "center";
          valign = "center";
          position = "0, 0";
          }
      ];

      input-field = [
        {
          size = "500, 40";
          position = "0, -100";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          # font_color = "rgb(241, 221, 30)";
          inner_color = "rgba(39, 230, 255, 0.2)";
          outer_color = "rgba(39, 230, 255, 0.2)";
          outline_thickness = 2;
          placeholder_text = "Enter password";
          shadow_passes = 2;
        }
      ];
    };
  };
}
