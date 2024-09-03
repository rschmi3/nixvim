{

  keymaps = [{
    action = "<cmd>NvimTreeOpen<CR>";
    key = "<leader>e";
  }];

  plugins.nvim-tree = {
    enable = true;
    disableNetrw = true;
    hijackCursor = true;
    hijackUnnamedBufferWhenOpening = true;
    openOnSetup = true;
    respectBufCwd = true;
    updateFocusedFile.enable = true;
  };
}
