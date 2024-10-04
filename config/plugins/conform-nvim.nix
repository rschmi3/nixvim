{ pkgs, ... }: {

  extraPackages = with pkgs; [
    # Used to format Lua code
    black
    isort
    nixfmt-classic
    nodePackages.prettier
    rustfmt
    stylua
    yamlfmt
  ];

  plugins.conform-nvim = {
    enable = true;

    settings = {
      default_format_opts.lsp_format = "fallback";

      formatters_by_ft = {
        nix = [ "nixfmt" ];
        python = [ "isort" "black" ];
        rust = [ "rustfmt" ];
        typescript = [ "prettier" ];
        yaml = [ "yamlfmt" ];
      };

      format_on_save = {
        lsp_format = "fallback";
        timeout_ms = 1000;
      };
    };
  };
}
