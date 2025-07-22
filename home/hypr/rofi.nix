{ pkgs, ... }:
{
  home.packages = with pkgs; [ rofi ];

  xdg.configFile."rofi/theme.rasi".text = ''
    * {
      border-col: rgba(39, 230, 255, 0.5);
      bg-col: rgba(0,0,0,0.5);
      highlight: rgba(39, 230, 255, 0.8);
      fg-col: rgba(255, 255, 255, 0.8);
    }
    '';

  xdg.configFile."rofi/config.rasi".text = ''
      configuration {
        show-icons: true;
        icon-theme: "Papirus-dark";
        drun-display-format: "{icon} {name}";
        hide-scrollbar: true;
        display-combi: " Launch: ";
        display-drun: " Apps ";
        display-run: " Run ";
        display-window: " Window ";
      }

      @theme "theme"

      window {
        border: 2px;
        border-color: @border-col;
        background-color: @bg-col;
        border-radius: 5px;
      }

      mainbox {
        background-color: @bg-col;
        border-radius: 5px;
      }

      inputbar {
        children: [prompt, entry];
        background-color: @bg-col;
        border-radius: 5px;
        padding: 0px;
      }

      prompt {
        padding: 16px;
        border-radius: 5px;
        background-color: rgba(0, 0, 0, 0);
        text-color: @highlight;
      }

      entry {
        padding: 10px;
        margin: 5px 5px 5px 5px;
        text-color: @fg-col;
        background-color: rgba(0, 0, 0, 0);
        border: 2px;
        border-color: @border-col;
        border-radius: 3px;
      }
      
      listview {
        border: 0px 0px 0px;
        columns: 1;
        background-color: rgba(0,0,0,0);
        text-color: @fg-col;
      }

      element{
        padding: 4px;
        margin: 0px 2px 0px 2px;
        background-color: rgba(0, 0, 0, 0);
        // text-color: @fg-col;
        border-radius: 5px;
      }

      element-icon {
        padding: 0px 4px 0px 0px;
        size: 24px;
        background-color: rgba(0, 0, 0, 0);
      }

      element-text {
        background-color: rgba(0, 0, 0, 0);
        padding: 5px;
        text-color: @fg-col;
      }

      element selected {
        background-color: @highlight;
        border: 2px;
        border-color: @border-col;
      }

      element-text selected {
        text-color: #000000;
      }
    '';
 }
