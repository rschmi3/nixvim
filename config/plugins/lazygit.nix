{
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
