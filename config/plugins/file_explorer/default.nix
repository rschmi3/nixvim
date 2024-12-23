{ ... }:
let
  explorer = "oil";
in
{
  imports = [
    ./nvim-tree.nix
    ./oil.nix
  ];

  config = {
    nvim-tree.enable = if explorer == "nvim-tree" then true else false;
    oil.enable = if explorer == "oil" then true else false;
  };
}
