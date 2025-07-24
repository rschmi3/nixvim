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
    ./r_nvim.nix
    ./render-markdown.nix
    ./telescope.nix
    ./treesitter.nix
    ./undo-tree.nix
    ./which-key.nix
  ];
  config = {
    bufferline.enable = false;
    plugins = {
      web-devicons.enable = true;
    };
    r_nvim.enable = true;
  };
}
