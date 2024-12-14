{ config, lib, ... }:
{
  options = {
    coq.enable = lib.mkEnableOption "Enables coq-nvim";
  };

  config = lib.mkIf config.coq.enable {
    plugins.coq-nvim = {
      enable = true;
      installArtifacts = true;
      settings = {
        auto_start = true;
      };
    };
  };
}
