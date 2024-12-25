{
  config = {
    keymaps = [
      {
        # Jump to next snippet
        action.__raw = ''
          function() 
            if ls.expand_or_jumpable() then
              ls.expand_or_jump()
            end
          end
        '';
        key = "<C-j>";
        mode = [
          "i"
          "s"
        ];
        options = {
          silent = true;
        };
      }
      {
        # Jump to previous snippet
        action.__raw = ''
          function()
            if ls.jumpable(-1) then
              ls.jump(-1)
            end
          end
        '';
        key = "<C-k>";
        mode = [
          "i"
          "s"
        ];
        options = {
          silent = true;
        };
      }
      {
        # List options
        action.__raw = ''
          function()
            if ls.choice_active() then
              ls.change_choice(1)
            end
          end
        '';
        key = "<C-l>";
        mode = [
          "i"
          "s"
        ];
      }
    ];

    plugins.luasnip = {
      enable = true;
      settings = {
        enable_autosnippets = true;
        update_events = "TextChanged,TextChangedI";
      };
    };
  };
}
