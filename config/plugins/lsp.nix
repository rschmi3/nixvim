{ pkgs, ... }:
{

  extraPackages = with pkgs; [
    nixfmt-rfc-style
    rust-analyzer
  ];

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
        "<leader>ca" = "code_action";
      };
    };

    servers = {

      cssls = {
        enable = true;
      };

      docker_compose_language_service.enable = true;
      dockerls.enable = true;

      gopls = {
        enable = true;
      };

      html.enable = true;
      htmx.enable = true;

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

      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };

      ts_ls.enable = true;
    };
  };
}
