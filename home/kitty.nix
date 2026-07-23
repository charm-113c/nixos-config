{ inputs, pkgs, ... }:
{
  programs.kitty = {
    enable = true;

    settings = {
      background_opacity = 0.65;
      background_blur = 0;

      confirm_os_window_close = 0;

      # Font settings
      font_family = "AnonymicePro Nerd Font";
      font_size = 13.0;

      # Cursor settings
      cursor = "#27E6FF";
      cursor_shape = "underline";
      cursor_trail = 10;
      cursor_trail_delay = "0.3 0.8";

      # Bell
      visual_bell_duration = 0.5;

      # Colors
      color4 = "#FF0000";
    };
  };
}
