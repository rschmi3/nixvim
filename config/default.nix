{
  # Import all your configuration modules here
  imports = [
    ./keymaps.nix
    ./options.nix
    ./plugins
  ];

  config = {

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        custom_highlights = ''
          function(colors)
            return {
              LineNrAbove = { fg = colors.overlay0 },
              LineNr = { fg = colors.lavender },
              LineNrBelow = { fg = colors.overlay0 }
            }
          end
        '';

        flavour = "frappe";
      };
    };

    globals.mapleader = " ";

    highlight = {
      # Comment.fg = "#ff00ff";
      # Comment.bg = "#000000";
      Comment.underline = true;
      Comment.bold = true;
    };

    plugins = {
      lualine.enable = true;
    };
  };

}
