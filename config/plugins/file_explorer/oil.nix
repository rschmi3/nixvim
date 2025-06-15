{ config, lib, ... }:
{
  options = {
    oil.enable = lib.mkEnableOption "Enables oil.nvim file explorer and settings";
  };

  config = lib.mkIf config.oil.enable {

    keymaps = [
      {
        action = "<cmd>Oil<CR>";
        key = "<C-e>";
      }
    ];

    plugins.oil = {
      enable = true;
      settings = {
        keymaps."<C-e>" = "actions.close";
        view_options = {
          show_hidden = true;
        };
      };
    };
  };
}
