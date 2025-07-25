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
  # boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_11; # Nvidia driver broken on 6.12, sticking to this for a while
  boot.loader = { 
    efi = { 
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      configurationLimit = 50;
    };
    timeout = 5;
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
  # Add more input methods (i.e. Japanese)
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
    ];
  };
  # Suppress env var warnings
  i18n.inputMethod.fcitx5.waylandFrontend = true;

  # Enable X11 windowing system
  services = {
    # Use GNOME
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    xserver = {
      enable = true;


      # Configure keyboard
      xkb = {
        layout = "it";
        variant = "";
      };

      # Enable Nvidia drivers
      videoDrivers = [ "nvidia" ];
      # Let's disable it to see if we get the opensource Nouveau drivers instead
      #
    };
  };

  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;

      # Optional helps save long term battery health
      START_CHARGE_THRESH_BAT1 = 40; # 40 and below it starts to charge
      STOP_CHARGE_THRESH_BAT1 = 60; # 80 and above it stops charging
    };
  };

  # Use Flatpak to install Vivaldi
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
    
  services.davfs2.enable = true;

  # GPU pkgs version is > 560 so we need
  hardware.nvidia.open = true;

  # Configure console keymap
  console = {
    keyMap = "it2";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
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

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "ls -l";
        edit = "~/.dotfiles/ && nvim";
        update = "sudo nixos-rebuild switch";
        sysupdate = "~/.dotfiles/ && sudo nix flake update && sudo nixos-rebuild switch";
        sclean = "sudo nix-collect-garbage --delete-older-than 7d";
      };

      # I'm also making use of Powerlevel10k
      # But it doesn't have a dedicated package
      # So I went with manual installation as on its Github repits Github repo

      # history.size = 10000;
      # history.ignoreAllDups = true;
      # history.path = "$HOME/.zsh_history";
      # history.ignorePatterns = ["rm *" "pkill *" "cp *"];
    };

    hyprland = {
      enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    };

    steam = {
        enable = true;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
        localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
      };
  };
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.charm = {
    isNormalUser = true;
    description = "Charm";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
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
     # xclip
     fzf
     fzf-zsh

     # Kanata for keyboard control
     kanata
     # tmux
     # cbonsai because yes
     # cbonsai
     zip
     unzip
     
     # Alacritty
     # alacritty
     # alacritty-theme

     # Gnome things
     # gnome.gnome-tweaks
     # gnome-extension-manager
     # gnomeExtensions.toggle-alacritty

     # Other software
     focuswriter
     discord
     # thunderbird
     # libreoffice-qt6-fresh
     obsidian
     # anki
     # osu-lazer
     docker
     # docker-compose
     # ltris # Tetris
     # unityhub
     # aseprite
     # godot

     # English word list
     hunspell
     hunspellDicts.en_GB-large

     # Languages
     gcc
     python3
     go
     # Guess I'll need these too, for JSON
     nodePackages_latest.npm
     nodejs_22
     gnumake
     binutils
     zulu # Open-source JDK
     # rars # RISC V Assembler and Runtime Simulator

     hyprland
     # Hyprland dependencies
     waybar
  ];

  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      data-root = "/home/charm/Programming/Docker";
    };
    # being in the docker user group is like being root, hence 
    # the use of rootless. However, I run into permission issues
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  fonts.packages = with pkgs; [
     # Nerd fonts now need to be installed one by one
     nerd-fonts.hack
     nerd-fonts.ubuntu
     nerd-fonts.hurmit
     nerd-fonts.monofur
     nerd-fonts.space-mono
     nerd-fonts.ubuntu-mono
     nerd-fonts.symbols-only
     nerd-fonts.comic-shanns-mono
     nerd-fonts.anonymice
     nerd-fonts.caskaydia-mono
     nerd-fonts.fantasque-sans-mono
     nerd-fonts.recursive-mono
  ];

  # Amane Kanata!
  services.kanata = {
    enable = true;
    # Map caps to esc/lsft
    # Hold tab to make it into a lctrl (more convenient in some cases)
    # Hold alt to temporarily switch back to normal kbd layout
    keyboards = {
      "logi".config = ''
(defsrc
  esc caps tab
)

(defalias
  nrm (tap-hold 500 500 esc (layer-toggle normal))
  cec (tap-hold 150 150 esc lsft)
  stab (tap-hold 200 200 tab lctl)
)

(deflayer default
  @nrm @cec @stab
)

(deflayer normal
  esc caps tab
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

      # Enable Cachix for Hyprland cache
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
    # garbage collector
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    optimise.automatic = true;
  };

  # ### Hyprland stuff ###
  # Enable polkit for Hyprland
  security.polkit.enable = true; # Omarun!

  environment.variables = rec {
      EDITOR = "nvim";
    };
}
