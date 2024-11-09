{ inputs, pkgs, ...}:
{
  imports = [
    inputs.anyrun.homeManagerModules.default
  ];

  programs.anyrun = {
    enable = true;
    config = {
      x = { fraction = 0.5; };
      y = { fraction = 0.3; };
      width = { fraction = 0.3; };
      hideIcons = false;
      ignoreExclusiveZones = false;
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
    # extraCss = /*css */ ''
    #   .some_class {
    #     background: red;
    #   }
    # '';
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
