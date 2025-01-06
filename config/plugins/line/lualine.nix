{ config, lib, ... }:
{
  options = {
    lualine.enable = lib.mkEnableOption "Enables lualine and sets settings";
  };

  config = lib.mkIf config.lualine.enable {
    plugins = {
      lualine = {
        enable = true;
      };
    };
  };
}
