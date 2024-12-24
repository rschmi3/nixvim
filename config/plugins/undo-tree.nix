{
  config = {
    keymaps = [
      {
        # Close current buffer without closing window
        action = "<cmd>UndotreeToggle<CR>";
        key = "<leader>u";
      }
    ];
    plugins.undotree = {
      enable = true;
    };
  };
}