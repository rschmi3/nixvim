{ pkgs, ... }:
{

  extraPackages = with pkgs; [ nixfmt-rfc-style ];

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
      # nil-ls = { enable = true; };

      pylsp = {
        enable = true;
      };

      rust-analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };

      ts-ls.enable = true;
    };
  };
}
