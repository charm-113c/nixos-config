{ inputs, pkgs, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {

      general = {
        ignore_empty_input = 1;
        grace = 20; # period in s after lock where mouse movement unlocks automatically
      };

      animation = [
          "fade, 1, 8, linear"
      ];

      background = {
          path = "~/.dotfiles/home/hypr/Wallpapers/9.jpg";
# "~/.dotfiles/home/hypr/Wallpapers/bioluminescence-5120x2880-15292.jpg";
          blur_passes = 0;
          blur_size = 4;
        };

      label = [
        {
          # Clock module
          text = "$TIME";
          # font_family = "Hurmit";
          color = "rgba(255, 255, 255, 0.7)";
          halign = "center";
          valign = "center";
          position = "-10, -200";
          font_size = 40;
          shadow_passes = 4;
          shadow_color = "rgba(0, 0, 0, 0.5)";
          }

        {
          # Message module
          text = "ご機嫌よう、ハーモニー。";
          color = "rgba(255, 255, 255, 0.7)";
          halign = "center";
          valign = "center";
          position = "-10, -275";
          shadow_passes = 2;
          shadow_color = "rgba(0, 0, 0, 0.5)";
          }
      ];

      # Decorative shape around texts
      shape = [
        {
          position = "-10, -235";
          halign = "center";
          valign = "center";
          size = "400, 200";
          color = "rgba(0,0,0,0.5)";
          rounding = 5;
          border_size = 2;
          border_color = "rgba(39, 230, 255, 0.5)";
          shadow_passes = 4;
          shadow_size = 10;
          shadow_color = "rgb(0, 0, 0)";
        }
      ];

      input-field = [
        {
          size = "500, 40";
          position = "-10, -90";
          font_color = "rgba(255, 255, 255, 0.7)";
          monitor = "";
          dots_center = true;
          fade_on_empty = true;
          # font_color = "rgb(241, 221, 30)";
          inner_color = "rgba(0,0,0,0.5)";
          outer_color = "rgba(39, 230, 255, 0.5)";
          outline_thickness = 2;
          placeholder_text = "Enter password";
          # shadow_passes = 2;
        }
      ];
    };
  };
}
