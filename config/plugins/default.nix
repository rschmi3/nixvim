{ ... }:
{
  imports = [
    ./bufferline.nix
    ./completion
    ./comment.nix
    ./conform-nvim.nix
    ./file_explorer
    ./floaterm.nix
    ./gitsigns.nix
    ./harpoon.nix
    ./lazygit.nix
    ./lsp.nix
    ./luasnip.nix
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
