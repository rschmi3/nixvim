{
  # Import all your configuration modules here
  imports = [ ./plugins ];

  config = {

    colorschemes.catppuccin = {
      enable = true;
      settings = { flavour = "frappe"; };
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
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>g";
      }
      {
        # Buffer Next
        action = "<cmd>bn<CR>";
        key = "<leader><tab>";
      }
      {
        # Buffer Previous
        action = "<cmd>bp<CR>";
        key = "<leader><S-Tab>";
      }
      {
        # Close current buffer without closing window
        action = "<cmd>b#|bd#<CR>";
        key = "<leader>q";
      }
      {
        # Close all buffers but current
        action = "<cmd>%bd|e#|bd#<CR>";
        key = "<leader>Q";
      }
    ];

    opts = {
      number = true; # Show line numbers
      relativenumber = false; # Show relative line numbers
      expandtab = true;
      shiftwidth = 2; # Tab width should be 2
      smartindent = false;
    };

    plugins = {

      lualine.enable = true;

      telescope.enable = true;
      oil.enable = false;
      treesitter = {
        enable = true;
        settings.indent.enable = true;
      };
      luasnip.enable = true;
    };
  };

}
