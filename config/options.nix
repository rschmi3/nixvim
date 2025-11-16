{
  config = {
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
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

    # This will use OSC 52 when available, fall back to system clipboard otherwise
    extraConfigLua = ''
      local function paste()
        return {
          vim.fn.split(vim.fn.getreg(""), "\n"),
          vim.fn.getregtype(""),
        }
      end

      vim.g.clipboard = {
        name = "OSC 52",
        copy = {
          ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
          ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
        },
        paste = {
          ["+"] = paste,
          ["*"] = paste,
        },
      }
    '';
  };
}
