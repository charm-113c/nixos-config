{ inputs, pkgs, ...}:
{
  imports = [
    inputs.anyrun.homeManagerModules.default
  ];

  programs.anyrun = {
    enable = true;
    config = {
      x = { fraction = 0.5; };
      y = { fraction = 0.5; };
      width = { fraction = 0.3; };
      height = { fraction = 0.3; };
      hideIcons = true;
      ignoreExclusiveZones = true;
      layer = "overlay";
      hidePluginInfo = false;
      closeOnClick = false;
      showResultsImmediately = false;
      maxEntries = null;

      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        # An array of all the plugins you want, which either can be paths to the .so files, or their packages
        applications
        # ./some_plugin.so
        # "${inputs.anyrun.packages.${pkgs.system}.anyrun-with-all-plugins}/lib/kidex"
        symbols
        shell 
        randr
        dictionary
        websearch
      ];
    };

    # Inline comments are supported for language injection into
    # multi-line strings with Treesitter! (Depends on your editor)
    extraCss = /*css */ ''
      #window {
        background-color: rgba(0,0,0,0.5);
      }
      #entry {
        background-color: rgba(0,0,0,0.8);
        border: 1px;
        border-color: rgba(39, 230, 255, 0.8);
        color: rgb(39, 230, 255);
      }
      #main {
        background-color: rgba(0,0,0,0.5);
        color: rgb(39, 230, 255);
        border-radius: 5px;
      }
      #match {
        color: rgb(39, 230, 255);
        background-color: rgba(0,0,0,0.5);
        /* border-radius: 5px; */
      }
      #match-desc {
        background-color: rgba(0,0,0,0.5);
        /* border-radius: 5px; */
      }
    '';
    #
    # extraConfigFiles."some-plugin.ron".text = ''
    #   Config(
    #     // for any other plugin
    #     // this file will be put in ~/.config/anyrun/some-plugin.ron
    #     // refer to docs of xdg.configFile for available options
    #   )
    # '';
  };
}

