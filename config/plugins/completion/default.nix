{ ... }:
let
  completion = "coq";
in
{
  imports = [
    ./cmp.nix
    ./coq.nix
  ];

  config = {
    cmp.enable = if completion == "cmp" then true else false;
    coq.enable = if completion == "coq" then true else false;
  };
}
