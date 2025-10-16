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
    {
      action = "<cmd>FloatermToggle air<CR>";
      key = "<A-a>";
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
