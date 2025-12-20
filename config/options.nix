{ pkgs, ... }:
{
  config = {
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = pkgs.stdenv.hostPlatform.isLinux;
    };
    opts = {
      cursorline = true;
      expandtab = true;
      ignorecase = true;
      number = true;
      relativenumber = true;
      scrolloff = 15;
      shiftwidth = 2;
      smartcase = true;
      smartindent = false;
      tabstop = 2;
      undofile = true;
      whichwrap = "b,s,<,>,h,l,[,]";
    };

    #   # This will use OSC 52 when available, fall back to system clipboard otherwise
    #   extraConfigLua = ''
    #     vim.g.clipboard = {
    #       name = "OSC 52",
    #       copy = {
    #         ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    #         ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    #       },
    #       paste = {
    #         ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    #         ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    #       },
    #     }
    #   '';
  };
}
