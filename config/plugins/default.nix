{ ... }:
{
  imports = [
    ./bufferline.nix
    ./completion
    ./conform-nvim.nix
    ./file_explorer
    ./floaterm.nix
    ./gitsigns.nix
    ./harpoon.nix
    ./lazygit.nix
    ./line
    ./lsp.nix
    ./telescope.nix
    ./treesitter.nix
    ./undo-tree.nix
    ./which-key.nix
  ];
  config = {
    bufferline.enable = false;
    plugins.web-devicons.enable = true;
  };
}
