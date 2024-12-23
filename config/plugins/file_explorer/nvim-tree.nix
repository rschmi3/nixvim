{ config, lib, ... }:
{
  options = {
    nvim-tree.enable = lib.mkEnableOption "Enables nvim-tree file explorer and settings";
  };

  config = lib.mkIf config.nvim-tree.enable {
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
  };
}
