{
  description = "My personal nixvim configuration using the nightly Neovim overlay.";

  inputs = {
    # Core inputs
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Neovim nightly overlay
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixvim
    nixvim.url = "github:nix-community/nixvim";

    # R language server flake
    r-language-server.url = "github:rschmi3/r_language_server_nix";
  };

  outputs =
    inputs@{
      flake-parts,
      nixpkgs,
      neovim-nightly-overlay,
      nixvim,
      r-language-server,
      ...
    }:
    let
      flake = flake-parts.lib.mkFlake { inherit inputs; } {
        systems = [
          "x86_64-linux"
          "aarch64-linux"
          "x86_64-darwin"
          "aarch64-darwin"
        ];

        perSystem =
          { system, ... }:
          let
            pkgs = import nixpkgs {
              inherit system;
              overlays = [ neovim-nightly-overlay.overlays.default ];
            };

            rLanguageServer = r-language-server.packages.${system}.r-language-server;

            nixvimLib = nixvim.lib.${system};
            nixvim' = nixvim.legacyPackages.${system};

            nixvimModule = {
              inherit pkgs;
              module = import ./config;
              extraSpecialArgs = {
                inherit inputs rLanguageServer;
              };
            };

            nvim = nixvim'.makeNixvimWithModule nixvimModule;
          in
          {
            packages.default = nvim;

            devShells.default = pkgs.mkShell {
              packages = [
                nvim
              ];
            };

            checks.default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
          };
      };
    in
    flake
    // {
      hydraJobs = {
        x86_64-linux = flake.packages.x86_64-linux.default;
        aarch64-linux = flake.packages.aarch64-linux.default;
        aarch64-darwin = flake.packages.aarch64-darwin.default;
      };
    };
}
