{ config, lib, ... }:
{
  options = {
    blink.enable = lib.mkEnableOption "Enables blink and sets keybinds";
  };

  config = lib.mkIf config.blink.enable {
    plugins = {
      blink-cmp = {
        enable = true;

        settings = {
          appearance = {
            nerd_font_variant = "mono";
            use_nvim_cmp_as_default = true;
          };
          keymap = {
            preset = "default";
          };
          signature = {
            enabled = true;
          };
        };
      };
    };
  };
}
