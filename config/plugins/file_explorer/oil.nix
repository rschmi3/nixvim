{ config, lib, ... }:
{
  options = {
    oil.enable = lib.mkEnableOption "Enables oil.nvim file explorer and settings";
  };

  config = lib.mkIf config.oil.enable {

    keymaps = [
      {
        action = "<cmd>Oil<CR>";
        key = "<leader>e";
      }
    ];

    plugins.oil = {
      enable = true;
      settings = {
        keymaps."<leader>e" = "actions.close";
        view_options = {
          show_hidden = true;
        };
      };
    };
  };
}
