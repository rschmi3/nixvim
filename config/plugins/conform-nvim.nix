{ pkgs, ... }: {

  extraPackages = with pkgs; [
    # Used to format Lua code
    nixfmt-classic
    nodePackages.prettier
    rustfmt
    stylua
  ];

  plugins.conform-nvim = {
    enable = true;

    settings = {
      formatters_by_ft = {
        nix = [ "nixfmt" ];
        rust = [ "rustfmt" ];
        typescript = [ "prettier" ];
      };

      format_on_save = {
        lsp_format = "fallback";
        timeout_ms = 500;
      };
    };
  };
}
