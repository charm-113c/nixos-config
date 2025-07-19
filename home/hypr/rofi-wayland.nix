{ inputs, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    theme = {
      "*" = {
        background-color = mkLiteral "rgba(0,0,0,0.2)";
        border-color = mkLiteral "rgba(39, 230, 255, 0.5)";
      };
    };
}
