{
  keymaps = [
    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>fg";
    }
    {
      action = "<cmd>Telescope find_files<CR>";
      key = "<leader>ff";
    }
    {
      action = "<cmd>Telescope buffers<CR>";
      key = "<leader>fb";
    }
    {
      action = "<cmd>Telescope help_tags<CR>";
      key = "<leader>fh";
    }
  ];

  plugins.telescope.enable = true;
}
