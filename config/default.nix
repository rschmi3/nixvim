{
  # Import all your configuration modules here
  imports = [ ./plugins ];

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

    keymaps = [
      {
        # Close current buffer without closing window
        action = "<cmd>b#|bd#<CR>";
        key = "<leader>q";
      }
    ];

    opts = {
      number = true; # Show line numbers
      relativenumber = true; # Show relative line numbers
      expandtab = true;
      shiftwidth = 2; # Tab width should be 2
      smartindent = false;
      whichwrap = "b,s,<,>,h,l,[,]";
    };

    plugins = {

      lualine.enable = true;

      oil.enable = false;
      nvim-colorizer.enable = true;
      treesitter = {
        enable = true;
        settings.indent.enable = true;
      };
      luasnip.enable = true;
    };
  };

}
