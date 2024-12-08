{ ... }:
{
  imports = [
    ./bufferline.nix
    ./cmp.nix
    ./comment.nix
    ./conform-nvim.nix
    ./floaterm.nix
    ./gitsigns.nix
    ./lazygit.nix
    ./lsp.nix
    ./nvim-tree.nix
    ./telescope.nix
    ./which-key.nix
  ];

  plugins.web-devicons.enable = true;
}
