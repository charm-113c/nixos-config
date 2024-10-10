# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader = { 
    efi = { 
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      configurationLimit = 10;
    };
    timeout = 10;
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  # Enable X11 windowing system
  services.xserver = {
    enable = true;

    # Use GNOME
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    # Configure keyboard
    xkb = {
      layout = "it";
      variant = "";
    };

    # Enable Nvidia drivers
    videoDrivers = [ "nvidia" ];
  };

  # GPU pkgs version is > 560 so we need 
  hardware.nvidia.open = true;

  # Configure console keymap
  console = {
    keyMap = "it2";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  programs = {
    # Install firefox.
    firefox.enable = true;

    # zshell
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "ls -l";
        edit = "sudo -e";
        update = "sudo nixos-rebuild switch";
      };

      # history.size = 10000;
      # history.ignoreAllDups = true;
      # history.path = "$HOME/.zsh_history";
      # history.ignorePatterns = ["rm *" "pkill *" "cp *"];
    };
  };
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.charm = {
    isNormalUser = true;
    description = "Charm";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
     # zshell
     zsh
     zsh-fast-syntax-highlighting
    ];
    shell = pkgs.zsh;
  };


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

     # Miscellaneous tools
     git
     htop
     wget
     neovim
     ripgrep
     fd
     # Allow copy/paste from/to Neovim
     xclip
     nerdfonts
     # Kanata for keyboard control
     kanata
     tmux
     # cbonsai because yes
     cbonsai
     
     # Alacritty
     alacritty
     alacritty-theme

     # Gnome things
     gnome.gnome-tweaks
     gnome-extension-manager
     gnomeExtensions.toggle-alacritty

     # Other software
     focuswriter
     discord
     thunderbird
     libreoffice-qt6-fresh

     # English word list
     hunspell
     hunspellDicts.en_GB-large

     # Languages
     gcc
     python3
     go

     # Hyprland dependencies
     egl-wayland # Nvidia GPU compatibility component

  ];

  # Amane Kanata!
  services.kanata = {
    enable = true;
    # Map caps to esc/lctl and right alt to left shift
    # Hold tab to make it into a lshift (more convenient in some cases)
    keyboards = { 
      "logi".config = ''
(defsrc 
  caps ralt tab 
)

(defalias 
  cec (tap-hold 200 200 esc lctl)
  stab (tap-hold 100 100 tab lsft)
)

(deflayer default 
  @cec lsft @stab
)
      '';
      };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    # garbage collector
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # ### Hyprland stuff ###
  # Enable polkit for Hyprland
  security.polkit.enable = true; # Omarun!

}
