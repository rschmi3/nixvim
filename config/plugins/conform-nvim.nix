{ lib, pkgs, ... }:
{

  extraPackages = with pkgs; [
    # Used to format Lua code
    black
    isort
    nixfmt-rfc-style
    nodePackages.prettier
    pgformatter
    rustfmt
    stylua
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
        go = [ "gofmt" ];
        javascript = [ "prettier" ];
        json = [ "prettier" ];
        nix = [ "nixfmt" ];
        python = [
          "isort"
          "black"
        ];
        rust = [ "rustfmt" ];
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
