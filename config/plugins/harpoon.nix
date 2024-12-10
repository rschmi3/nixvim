{ pkgs, ... }:
{
  plugins.harpoon = {
    enable = true;
    enableTelescope = true;
    keymaps = {
      addFile = "<leader>m";
      navFile = {
        "1" = "<C-1>";
        "2" = "<C-2>";
        "3" = "<C-3>";
        "4" = "<C-4>";
      };
      navNext = "<leader><tab>";
      navPrev = "<leader><S-tab>";
      toggleQuickMenu = "<leader><S-m>";
    };
    markBranch = true;
  };
}
