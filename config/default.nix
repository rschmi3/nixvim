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
          end'';
        desc = "Disable line numbers in terminal";
        event = [ "TermOpen" ];
        group = "custom_term_open";
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

    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
  };

}
