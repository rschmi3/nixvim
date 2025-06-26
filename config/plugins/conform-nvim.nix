{ lib, pkgs, ... }:
{

  extraPackages = with pkgs; [
    # Used to format Lua code
    beautysh
    black
    isort
    nixfmt-rfc-style
    nodePackages.prettier
    pgformatter
    rustfmt
    stylua
  ];

  keymaps = [
    {
      action.__raw = ''
        function()
          require("conform").format({async = true})
        end'';
      key = "<leader><leader>x";
      mode = [ "n" ];
    }
  ];

  plugins.conform-nvim = {
    enable = true;

    settings = {
      default_format_opts.lsp_format = "fallback";

      formatters = {
        pg_format = {
          command = lib.getExe pkgs.pgformatter;
          prepend_args = [ "--no-space-function" ];
        };
      };

      formatters_by_ft = {
        bash = [ "beautysh" ];
        css = [ "prettier" ];
        go = [ "gofmt" ];
        javascript = [ "prettier" ];
        json = [ "prettier" ];
        lua = [ "stylua" ];
        nix = [ "nixfmt" ];
        python = [
          "isort"
          "black"
        ];
        rust = [ "rustfmt" ];
        sh = [ "beautysh" ];
        sql = [ "pg_format" ];
        typescript = [ "prettier" ];
      };

      format_on_save = {
        lsp_format = "fallback";
        timeout_ms = 1000;
      };
    };
  };
}
