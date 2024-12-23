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
      {
        # Page up and centre
        action = "<C-u>zz";
        key = "<C-u>";
      }
      {
        # Page down and centre
        action = "<C-d>zz";
        key = "<C-d>";
      }
      {
        # Next quickfix
        action = "<cmd>cnext<CR>";
        key = "<M-j>";
      }
      {
        # Previous quickfix
        action = "<cmd>cprev<CR>";
        key = "<M-k>";
      }
      {
        # Close quickfix
        action = "<cmd>cclose<CR>";
        key = "<M-c>";
      }
      {
        action = "<cmd>lua vim.diagnostic.setqflist({severity=vim.diagnostic.severity.ERROR})<CR>";
        key = "<M-d>";
      }
    ];

    opts = {
      expandtab = true;
      number = true; # Show line numbers
      relativenumber = true; # Show relative line numbers
      scrolloff = 10;
      shiftwidth = 2; # Tab width should be 2
      smartindent = false;
      tabstop = 2;
      whichwrap = "b,s,<,>,h,l,[,]";
    };

    plugins = {
      lualine.enable = true;
      luasnip.enable = true;
    };
  };

}
