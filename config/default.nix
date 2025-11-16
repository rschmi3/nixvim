{ inputs, pkgs, ... }:
{
  # Import all your configuration modules here
  imports = [
    ./keymaps.nix
    ./options.nix
    ./plugins
  ];

  config = {

    autoCmd = [
      {
        callback.__raw = ''
          function()
            vim.highlight.on_yank()
          end'';
        desc = "Highlight when yanking (copying) text";
        event = [ "TextYankPost" ];
        group = "highlight_yank";
      }
      {
        callback.__raw = ''
          function()
            vim.opt.number = false
            vim.opt.relativenumber = false

            -- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
            -- or just use <C-\><C-n> to exit terminal mode
            vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { buffer = true, desc = "Exit terminal mode" })
          end'';
        desc = "Disable line numbers in terminal";
        event = [ "TermOpen" ];
        group = "custom_term_open";
        pattern = "term://^{*lazygit*}";
      }
    ];

    autoGroups = {
      custom_term_open = {
        clear = true;
      };

      highlight_yank = {
        clear = true;
      };
    };

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        # custom_highlights = ''
        #   function(colors)
        #     return {
        #       LineNrAbove = { fg = colors.overlay0 },
        #       LineNr = { fg = colors.lavender },
        #       LineNrBelow = { fg = colors.overlay0 }
        #     }
        #   end
        # '';

        flavour = "macchiato";
      };
    };

    globals.mapleader = " ";

    package = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };

}
