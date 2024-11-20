{

  keymaps = [
    {
      # Buffer Next
      action = "<cmd>BufferLineCycleNext<CR>";
      key = "<leader><tab>";
    }
    {
      # Buffer Previous
      action = "<cmd>BufferLineCyclePrev<CR>";
      key = "<leader><S-Tab>";
    }
    {
      # Close all buffers but current
      action = "<cmd>BufferLineCloseOthers<CR>";
      key = "<leader>Q";
    }
    {
      # Move Current Buffer Right
      action = "<cmd>BufferLineMoveNext<CR>";
      key = "<leader>b<Right>";
    }
    {
      # Move Current Buffer Left
      action = "<cmd>BufferLineMovePrev<CR>";
      key = "<leader>b<Left>";
    }
  ];
  plugins.bufferline = {
    enable = true;
    offsets = [
      {
        filetype = "NvimTree";
        highlight = "Directory";
        text = "File Explorer";
        text_align = "center";
      }
    ];
  };
}
