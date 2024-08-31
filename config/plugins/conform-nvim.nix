{ pkgs, ... }: {

  extraPackages = with pkgs; [
    # Used to format Lua code
    stylua
    rustfmt
  ];

  keymaps = [{
    action = "<cmd>NvimTreeOpen<CR>";
    key = "<leader>e";
  }];

  plugins.conform-nvim = {
    enable = true;

    settings = {
      formatters_by_ft = {
        nix = [ "nixfmt" ];
        rust = [ "rustfmt" ];
      };

      format_on_save = {
        lsp_format = "fallback";
        timeout_ms = 500;
      };
    };
  };
}
