{
  keymaps = [
    {
      action = "gcc";
      key = "<leader>/";
      mode = [ "n" ];
      options.remap = true;
    }
    {
      action = "gc";
      key = "<leader>/";
      mode = [ "v" ];
      options.remap = true;
    }
  ];

  plugins.comment = {
    enable = true;
  };
}
