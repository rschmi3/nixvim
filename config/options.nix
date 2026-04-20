{ pkgs, ... }:
{
  config = {
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = pkgs.stdenv.hostPlatform.isLinux;
    };
    extraConfigLuaPost = ''
      if (vim.env.SSH_CONNECTION or vim.env.SSH_TTY) and not vim.env.TMUX then
        vim.g.clipboard = {
          name = "OSC 52",
          copy = {
            ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
            ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
          },
          paste = {
            ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
            ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
          },
        }
      end
    '';
    opts = {
      autoread = true;
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

  };
}
