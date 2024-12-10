{ ... }:
{
  imports = [
    ./cmp.nix
    ./comment.nix
    ./conform-nvim.nix
    ./floaterm.nix
    ./gitsigns.nix
    ./harpoon.nix
    ./lazygit.nix
    ./lsp.nix
    ./nvim-tree.nix
    ./telescope.nix
    ./treesitter.nix
    ./treesitter-context.nix
    ./which-key.nix
  ];

  plugins.web-devicons.enable = true;
}
