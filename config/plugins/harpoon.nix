{ pkgs, ... }:
{

  plugins.harpoon = {
    enable = true;
    luaConfig.post = ''
      local harpoon = require("harpoon")

      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, {desc = "Harpoon List Add"})
      vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "Harpoon List Toggle"} )

      vim.keymap.set({"n", "v"}, "<C-h>", function() harpoon:list():select(1) end, {desc = "Harpoon Buffer 1"})
      vim.keymap.set({"n", "v"}, "<C-j>", function() harpoon:list():select(2) end, {desc = "Harpoon Buffer 2"})
      vim.keymap.set({"n", "v"}, "<C-k>", function() harpoon:list():select(3) end, {desc = "Harpoon Buffer 3"})
      vim.keymap.set({"n", "v"}, "<C-l>", function() harpoon:list():select(4) end, {desc = "Harpoon Buffer 4"})
      vim.keymap.set({"n", "v"}, "<C-;>", function() harpoon:list():select(5) end, {desc = "Harpoon Buffer 5"})

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, {desc = "Harpoon Previous Buffer"})
      vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, {desc = "Harpoon Next Buffer"})
    '';
  };
}
