{ ... }: {
  imports = [
    ./bufferline.nix
    ./cmp.nix
    ./comment.nix
    ./conform-nvim.nix
    ./floaterm.nix
    ./lazygit.nix
    ./lsp.nix
    ./nvim-tree.nix
    ./telescope.nix
  ];

  plugins.web-devicons.enable = true;
}
