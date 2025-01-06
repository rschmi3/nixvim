{ ... }:
let
  line = "lualine";
in
{
  imports = [
    ./lualine.nix
  ];

  config = {
    lualine.enable = if line == "lualine" then true else false;
  };
}
