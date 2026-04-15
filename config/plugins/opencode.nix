{ ... }:
{
  keymaps = [
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>oa";
      action.__raw = ''function() require("opencode").ask("@this: ", { submit = true  }) end'';
      options.desc = "Ask opencode and submit";
    }
    {
      mode = "n";
      key = "<leader>ov";
      action.__raw = ''function() require("opencode").select() end'';
      options.desc = "opencode select";
    }
    {
      mode = "n";
      key = "<leader>ot";
      action.__raw = ''function() require("opencode").toggle() end'';
      options.desc = "opencode toggle";
    }
    {
      mode = "n";
      key = "<leader>oc";
      action.__raw = ''function() require("opencode").stop() end'';
      options.desc = "opencode stop";
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "go";
      action.__raw = ''function() return require("opencode").operator("@this ") end'';
      options = {
        desc = "Add range to opencode";
        expr = true;
      };
    }
    {
      mode = "n";
      key = "goo";
      action.__raw = ''function() return require("opencode").operator("@this ") .. "_" end'';
      options = {
        desc = "Add line to opencode";
        expr = true;
      };
    }
    {
      mode = "n";
      key = "<S-C-u>";
      action.__raw = ''function() require("opencode").command("session.half.page.up") end'';
      options.desc = "Scroll opencode up";
    }
    {
      mode = "n";
      key = "<S-C-d>";
      action.__raw = ''function() require("opencode").command("session.half.page.down") end'';
      options.desc = "Scroll opencode down";
    }
    {
      mode = "t";
      key = "<C-w>h";
      action = "<C-\\><C-n><C-w>h";
      options.desc = "Exit terminal and move left";
    }
  ];

  extraConfigLuaPost = ''
    local ask_win = require("opencode.config").opts.ask.snacks.win

    ask_win.keys.i_s_cr = nil
    ask_win.keys.i_m_cr = {
      "<M-CR>",
      function(win)
        -- Append `\n` to trigger opencode.nvim's append behavior.
        local text = win:text() .. "\\n"
        vim.api.nvim_buf_set_lines(win.buf, 0, -1, false, { text })
        win:execute("confirm")
      end,
      mode = "i",
      desc = "append",
    }

    ask_win.footer_keys = { "<CR>", "<M-CR>" }
  '';

  plugins = {
    opencode = {
      enable = true;
      settings = {
        auto_reload = true;
        events.reload = true;
        port = 9000;

        server = {
          start.__raw = ''
            function()
              require('snacks.terminal').open('opencode --port 9000', {
                win = {
                  position = 'right',
                  enter = false,
                  on_win = function(win)
                    require('opencode.terminal').setup(win.win)
                  end,
                },
              })
            end
          '';
          stop.__raw = ''
            function()
              require('snacks.terminal').get('opencode --port 9000', {
                win = { position = 'right', enter = false },
              }):close()
            end
          '';
          toggle.__raw = ''
            function()
              require('snacks.terminal').toggle('opencode --port 9000', {
                win = {
                  position = 'right',
                  enter = false,
                  on_win = function(win)
                    require('opencode.terminal').setup(win.win)
                  end,
                },
              })
            end
          '';
        };
      };
    };

    snacks = {
      enable = true;
      settings = {
        input.enabled = true;
        picker.enabled = true;
        terminal.enabled = true;
      };
    };
  };
}
