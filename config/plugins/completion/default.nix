{ ... }:
let
  completion = "blink";
in
{
  imports = [
    ./blink.nix
    ./cmp.nix
    ./coq.nix
  ];

  config = {
    blink.enable = if completion == "blink" then true else false;
    cmp.enable = if completion == "cmp" then true else false;
    coq.enable = if completion == "coq" then true else false;
  };
}
