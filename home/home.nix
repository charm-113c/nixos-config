{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hypr/hyprland.nix
    ./hypr/anyrun.nix
    ./hypr/waybar.nix
    ./hypr/hyprpaper.nix
    ./hypr/hypridle.nix
    ./hypr/hyprlock.nix
    ./hypr/wofi.nix

    ./kitty.nix

  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "charm";
  home.homeDirectory = "/home/charm";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    timer
    kitty
    btop
    sway

    # Desktop utility
    pipewire
    dunst
    brightnessctl
    wofi
    playerctl
    wl-clipboard
    clipboard-jh
    peaclock

    # File system viewer
    xfce.thunar
    superfile
    # Image viewer
    xfce.ristretto
    xfce.tumbler # and its accompanying thumbnailling daemon
    nwg-look

    # Hypr stuff
    hyprpaper
    hypridle
    hyprlock
    hyprpicker
    hyprshot

    # Utility software
    notes
    gimp
    zip
    unzip
     # libreoffice-qt6-fresh
   ];

  programs.tmux = {
      enable = true;
      # Modify keybinds
      extraConfig = ''
        # remap prefix from "C-b" to "M-t" (e.g. alt + t)
        unbind C-b
        set-option -g prefix M-z
        bind-key M-z send-prefix

        # split panes with i and -
        bind i split-window -h 
        bind - split-window -v 
        unbind '"'
        unbind %

        # Move between panes with vi keybinds
        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R
      '';
    };

  programs.alacritty = {
      enable = true;

      settings = {
          window = {
            opacity = 0.8;
            startup_mode = "Maximized";
            title = "You Write Your Own Story";
          };
        };
    };

  # programs.btop = {
  # theme can't be changed from here for some reason,
  # has to be done straight on its config File
  # (also, copy the horizon theme from the btop github
  # repo, it's very nice)


}
