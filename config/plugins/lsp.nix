{
  lib,
  pkgs,
  rLanguageServer,
  ...
}:
{

  extraPackages = with pkgs; [
    nixfmt-rfc-style
    rust-analyzer
  ];

  lsp.keymaps = [
    {
      action = lib.nixvim.mkRaw "function() vim.diagnostic.jump({ count=-1, float=true }) end";
      key = "<leader>k";
    }
    {
      action = lib.nixvim.mkRaw "function() vim.diagnostic.jump({ count=1, float=true }) end";
      key = "<leader>j";
    }
  ];

  plugins.lsp = {
    enable = true;

    keymaps = {
      diagnostic = {
        "<leader>d" = "open_float";
      };

      lspBuf = {
        grd = "definition";
        grt = "type_definition";
      };
    };

    servers = {

      ccls = {
        enable = true;
      };

      cssls = {
        enable = true;
      };

      docker_compose_language_service.enable = true;
      dockerls.enable = true;

      gopls = {
        enable = true;
      };

      html.enable = true;
      htmx.enable = false;

      lua_ls = {
        enable = true;
        settings.telemetry.enable = false;
      };

      nixd = {
        enable = true;
        settings = {
          formatting.command = [ "nixfmt" ];
          nixpkgs.expr = "import <nixpkgs> { }";
          options = {
            nixos.expr = ''(builtins.getFlake "github:rschmi3/nixos").nixosConfigurations.nix-fw13.options'';
          };
        };
      };
      # nil_ls = { enable = true; };

      pylsp = {
        enable = true;
      };

      r_language_server = {
        enable = true;
        cmd = [ "r_language_server" ];
        package = rLanguageServer;
      };

      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };

      ts_ls.enable = true;
    };
  };
}
