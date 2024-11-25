{

  keymaps = [
    {
      action = "<cmd>NvimTreeToggle<CR>";
      key = "<leader>e";
    }
  ];

  plugins.nvim-tree = {
    enable = true;
    actions = {
      openFile.quitOnOpen = true;
    };
    disableNetrw = true;
    git = {
      enable = true;
      ignore = false;
    };
    hijackCursor = true;
    hijackUnnamedBufferWhenOpening = true;
    openOnSetup = true;
    respectBufCwd = true;
    updateFocusedFile.enable = true;
  };
}
