{ ... }:
{
  imports = [
    ./bufferline.nix
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
    ./undo-tree.nix
    ./which-key.nix
  ];
  config = {
    bufferline.enable = false;
    plugins.web-devicons.enable = true;
  };
}
