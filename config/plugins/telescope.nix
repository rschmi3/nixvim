{ pkgs, ... }:
{
  extraPackages = with pkgs; [ ripgrep ];

  keymaps = [
    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>fg";
    }
    {
      action = "<cmd>Telescope find_files hidden=true<CR>";
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

  plugins.telescope = {
    enable = true;
    settings = {
      defaults = {
        file_ignore_patterns = [
          "^.cargo"
          "^.git"
          "^node_modules"
          "^.npm"
          "^.rustup"
        ];
      };
    };
  };
}
