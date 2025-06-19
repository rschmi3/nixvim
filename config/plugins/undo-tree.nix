{
  config = {
    keymaps = [
      {
        # Close current buffer without closing window
        action = "<cmd>UndotreeToggle<CR>";
        key = "<leader>u";
        options = {
          desc = "Toggle Undotree";
        };
      }
    ];
    plugins.undotree = {
      enable = true;
      settings = {
        SetFocusWhenToggle = true;
      };
    };
  };
}
