{ inputs, pkgs, ... }:
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
              color: rgb(255, 47, 208);
              border-radius: 10px;
            }
          #entry:selected {
              background-color: rgba(53, 231, 244, 0.2);
              color: rgb(53, 231, 244);
              border: none;
            }
        '';
      };
  }
