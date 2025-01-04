{ config, lib, ... }:
{
  options = {
    cmp.enable = lib.mkEnableOption "Enables cmp and sets keybinds";
  };

  config = lib.mkIf config.cmp.enable {
    plugins = {
      cmp = {
        enable = true;
        autoEnableSources = true;

        settings = {
          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          };

          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "path"; }
            { name = "buffer"; }
          ];

          snippet = {
            expand = ''
              function(args)
                require('luasnip').lsp_expand(args.body)
              end
            '';
          };
        };
      };
    };
  };
}
