{ inputs, pkgs, ... }:
{
    programs.kitty = {
        enable = true;

        settings = {
            background_opacity = 0.8;

            # Font settings
            font_family = "Hurmit Nerd Font";
            font_size = 12.0;

            # Cursor settings
            cursor = "#27E6FF";
            cursor_shape = "underline";
            cursor_trail = 10;

            # Bell
            visual_bell_duration = 0.5;

            # Colors
            color4 = "#27E6FF"; # blue's dull version
            # color12 = ""; # blue's bright version
          };
      };
  }
