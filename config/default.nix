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
        action = "<cmd>bp<CR>";
        key = "<leader><tab>";
      }
      {
        action = "<cmd>bn<CR>";
        key = "<leader><S-Tab>";
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
      cmp = {
        enable = true;
        autoEnableSources = true;

        settings = {
          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          };

          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
            { name = "luasnip"; }
          ];
        };
      };

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
