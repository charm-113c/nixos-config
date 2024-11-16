{ inputs, pkgs, ... }:
let
  primary_col = "rgb(53, 231, 244)";
  primary_shade = "rgba(53, 231, 244, 0.2)";
  primary_shade_med = "rgba(53, 231, 244, 0.5)";
  primary_shade_bold = "rgba(53, 231, 244, 0.8)";
  second_col = "rgb(255, 47, 208)";
  second_shade = "rgba(255, 47, 208, 0.2)";
  second_shade_med = "rgba(255, 47, 208, 0.5)";
  second_shade_bold = "rgba(255, 47, 208, 0.8)";
in 
{
    programs.wofi = {
        enable = true;

        settings = {
            # mode = "dmenu";
            hide_search = true;
            hide_scroll = true;
            width = 200;
            height = 170;
            location = "top-left";
            yoffset = 5;
          };
        
        style = ''
          #input {
              margin: -1000px 5px;
              /* This ridiculous value serves only to eliminate
                the remnants of the search bar */
            }
          #window {
              background-color: rgba(0,0,0,0.8);
              border-radius: 10px;
            }
          #outer-box {
              border-radius: 10px;
            }
          #entry {
              border: none;
              /* color: rgb(255, 47, 208); */
              border-radius: 10px;
              color: #FFF3D5;
              text-shadow: 0px 0px 5px ${second_col};
            }
          #entry:selected {
              background-color: ${primary_shade};
              color: ${primary_col};
              border: none;
              text-shadow: 0px 0px 5px ${primary_col};
            }
        '';
      };
  }
