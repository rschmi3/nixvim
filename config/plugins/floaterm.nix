{
  keymaps = [
    {
      action = "<cmd>FloatermToggle scratch<CR>";
      key = "<A-t>";
      mode = [
        "i"
        "n"
        "t"
        "v"
      ];
    }
  ];
  plugins.floaterm = {
    enable = true;
    settings = {
      height = 0.9;
      width = 0.9;
    };
  };
}
