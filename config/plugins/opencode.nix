{ ... }:
{
  keymaps = [
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>oa";
      action.__raw = ''
        function()
          _G.nixvim_opencode.ensure_target(function(target)
            if not target then
              return
            end

            require("opencode").ask("@this: ", { submit = true })
          end)
        end
      '';
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
      key = "<leader>os";
      action.__raw = "function() _G.nixvim_opencode.select_target() end";
      options.desc = "Attach to opencode server";
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

    _G.nixvim_opencode = (function()
      local M = {}
      local state = {
        initialized = false,
        prompting = false,
        callbacks = {},
        mode = nil,
        port = nil,
        url = nil,
        owned_local_cmd = nil,
      }

      local function notify(message, level)
        vim.notify(message, level or vim.log.levels.INFO, { title = "opencode" })
      end

      local function port_url(port)
        return string.format("http://127.0.0.1:%d", port)
      end

      local function local_cmd(port)
        return string.format("opencode --port %d", port)
      end

      local function remote_cmd(port)
        return string.format("opencode attach %s", port_url(port))
      end

      local function terminal_opts()
        return {
          win = {
            position = "right",
            enter = false,
            on_win = function(win)
              require("opencode.terminal").setup(win.win)
            end,
          },
        }
      end

      local function stop_owned_local()
        local cmd = state.owned_local_cmd
        if not cmd then
          return
        end

        local terminal = require("snacks.terminal").get(cmd, { create = false })
        if terminal then
          terminal:close()
        end
        state.owned_local_cmd = nil
      end

      local function set_target(mode, port)
        local next_local_cmd = mode == "local" and local_cmd(port) or nil
        if state.owned_local_cmd and state.owned_local_cmd ~= next_local_cmd then
          stop_owned_local()
        end

        if mode == "local" then
          require("opencode.events").disconnect()
        end

        state.initialized = true
        state.mode = mode
        state.port = port
        state.url = port_url(port)
      end

      local function resolve_target(callback)
        vim.ui.input({
          prompt = "Opencode port: ",
          default = state.port and tostring(state.port) or "9000",
        }, function(input)
          state.prompting = false

          if not input or vim.trim(input) == "" then
            local callbacks = state.callbacks
            state.callbacks = {}
            for _, cb in ipairs(callbacks) do
              cb(nil)
            end
            return
          end

          local port = tonumber(vim.trim(input))
          if not port then
            notify("Invalid opencode port: " .. input, vim.log.levels.ERROR)
            local callbacks = state.callbacks
            state.callbacks = {}
            for _, cb in ipairs(callbacks) do
              cb(nil)
            end
            return
          end

          require("opencode.server")
            .new(port)
            :next(function(server)
              set_target("remote", port)
              require("opencode.events").connect(server)
              notify(string.format("Attached to opencode on port %d (%s)", server.port, server.cwd))
              local callbacks = state.callbacks
              state.callbacks = {}
              for _, cb in ipairs(callbacks) do
                cb(state)
              end
            end)
            :catch(function()
              set_target("local", port)
              notify(string.format("Using local opencode on port %d", port))
              local callbacks = state.callbacks
              state.callbacks = {}
              for _, cb in ipairs(callbacks) do
                cb(state)
              end
            end)
        end)
      end

      function M.ensure_target(callback)
        callback = callback or function() end

        if state.initialized and state.port then
          callback(state)
          return
        end

        table.insert(state.callbacks, callback)
        if state.prompting then
          return
        end

        state.prompting = true
        resolve_target(callback)
      end

      function M.select_target()
        local previous = vim.deepcopy(state)
        state.initialized = false
        M.ensure_target(function(target)
          if target then
            return
          end

          state = previous
        end)
      end

      function M.current_port(callback)
        M.ensure_target(function(target)
          if target then
            callback(target.port)
          end
        end)
      end

      function M.current_cmd()
        if not (state.initialized and state.port) then
          return nil
        end

        if state.mode == "remote" then
          return remote_cmd(state.port)
        end

        return local_cmd(state.port)
      end

      function M.start_or_show_current()
        M.ensure_target(function(target)
          if not target then
            return
          end

          local cmd = M.current_cmd()
          local terminal = require("snacks.terminal").get(cmd, { create = false })
          if terminal then
            terminal:show()
            return
          end

          require("snacks.terminal").open(cmd, terminal_opts())
          if target.mode == "local" then
            state.owned_local_cmd = cmd
          end
        end)
      end

      function M.toggle_current()
        M.ensure_target(function(target)
          if not target then
            return
          end

          require("snacks.terminal").toggle(M.current_cmd(), terminal_opts())
          if target.mode == "local" then
            state.owned_local_cmd = M.current_cmd()
          end
        end)
      end

      function M.stop_local()
        stop_owned_local()
      end

      return M
    end)()

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

        server = {
          port.__raw = ''
            function(callback)
              _G.nixvim_opencode.current_port(callback)
            end
          '';
          start.__raw = ''
            function()
              _G.nixvim_opencode.start_or_show_current()
            end
          '';
          stop.__raw = ''
            function()
              _G.nixvim_opencode.stop_local()
            end
          '';
          toggle.__raw = ''
            function()
              _G.nixvim_opencode.toggle_current()
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
