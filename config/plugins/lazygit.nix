{
  autoCmd = [
    {
      callback.__raw = ''
        function()
          vim.keymap.set("t", "<Esc><Esc>", "<Nop>", { buffer = true, silent = true })
        end'';
      desc = "Disable terminal mode exit in lazygit";
      event = [ "TermOpen" ];
      group = "lazygit";
      pattern = "term://*lazygit*";
    }
  ];

  autoGroups = {
    lazygit = {
      clear = true;
    };
  };

  keymaps = [
    {
      action = "<cmd>LazyGit<cr>";
      key = "<leader>lg";
      mode = [ "n" ];
      options = {
        desc = "LazyGit";
      };
    }
  ];
  plugins.lazygit = {
    enable = true;
    settings = {
      floating_window_use_plenary = 1;
    };
  };
}
