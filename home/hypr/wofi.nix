{ inputs, pkgs, ... }:
{
    programs.wofi = {
        enable = true;

        settings = {
            # mode = "dmenu";
            hide_search = true;
            hide_scroll = true;
            width = 400;
            height = 400;
            normal_window = true;
            location = 1;
            yoffset = 30; # Equal to waybar height
          };
        
        style = ''
          #input {
              margin: -1000px 5px;
              /* This ridiculous value serves only to eliminate
                the remnants of the search bar */
            }
        '';
      };
  }
