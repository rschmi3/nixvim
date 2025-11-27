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
        keymaps."<C-h>" = false;
        keymaps."<C-s>" = "actions.select_split";
        keymaps."<C-v>" = "actions.select_vsplit";
        view_options = {
          show_hidden = true;
        };
      };
    };
  };
}
