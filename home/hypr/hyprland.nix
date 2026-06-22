{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  active_col = "rgb(27e6ff)";
  inactive_col = "rgba(27e6ff4d)";
  tab_active_col = "rgba(ff0000c8)";
  tab_inactive_col = "rgba(00000088)";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    # Use pkg from NixOS modules
    package = null;
    portalPackage = null;

    configType = "lua"; # So they're using lua now. Cool.
    # One day we will need to refactor this whole thing to lua

    # Today is that day.
    # Instead of defining settings into Nix-fied lua, which is a bitch, we import files
    extraLuaFiles = {
      "config" = {
        content = builtins.readFile ./hyprland.lua;
        autoLoad = true; # Creates a `require(filename)` in ~/.config/hypr/hyprland.lua, the generated config file
      };
      # Could consider breaking this down in multiple files
    };

  };
}
