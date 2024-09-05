{
  plugins.lsp = {
    enable = true;

    keymaps = {
      diagnostic = {
        "<leader>j" = "goto_next";
        "<leader>k" = "goto_prev";
        "<leader>d" = "open_float";
      };

      lspBuf = {
        K = "hover";
        gD = "references";
        gd = "definition";
        gi = "implementation";
        gt = "type_definition";
      };
    };

    servers = {

      docker-compose-language-service.enable = true;
      dockerls.enable = true;

      lua-ls = {
        enable = true;
        settings.telemetry.enable = false;
      };

      nil-ls = { enable = true; };

      rust-analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };

      tsserver.enable = true;
    };
  };
}
