{ pkgs, ... }:
{
  plugins.harpoon = {
    enable = true;
    keymaps = {
      addFile = "<leader>a";
      navFile = {
        "1" = "<C-1>";
        "2" = "<C-2>";
        "3" = "<C-3>";
        "4" = "<C-4>";
        "5" = "<C-5>";
      };
      navNext = "<C-S-N";
      navPrev = "<C-S-P>";
      toggleQuickMenu = "<leader>e";
    };
    markBranch = true;
  };
}
