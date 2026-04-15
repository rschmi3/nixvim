{ config, lib, ... }:
{
  options = {
    lualine.enable = lib.mkEnableOption "Enables lualine and sets settings";
  };

  config = lib.mkIf config.lualine.enable {
    plugins = {
      lualine = {
        enable = true;
        settings.sections.lualine_z = [
          {
            "__unkeyed-1".__raw = ''function() return require("opencode").statusline() end'';
          }
        ];
      };
    };
  };
}
