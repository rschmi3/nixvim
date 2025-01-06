{ pkgs, ... }:
{
  keymaps = [
    {
      action.__raw = ''
        function()
          require("which-key").show({ global = false })
        end
      '';
      key = "<leader>?";
      options = {
        desc = "Buffer Local Keymaps (which-key)";
      };
    }
  ];
  plugins.which-key = {
    enable = true;
  };
}
