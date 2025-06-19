{ pkgs, ... }:
{
  extraPackages = with pkgs; [ ripgrep ];

  keymaps = [
    {
      action = "<cmd>Telescope find_files hidden=true no_ignore=true<CR>";
      key = "<leader>ff";
    }
    {
      action = "<cmd>Telescope buffers<CR>";
      key = "<leader>fb";
    }
    {
      action = "<cmd>Telescope help_tags<CR>";
      key = "<leader>fh";
    }
  ];

  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native.enable = true;
    };

    luaConfig.post = ''
      local pickers = require("telescope.pickers")
      local finders = require("telescope.finders")
      local make_entry = require("telescope.make_entry")
      local conf = require("telescope.config").values

      local live_multigrep = function(opts)
        opts = opts or {}
        opts.cwd = opts.cwd or vim.uv.cwd()

        local finder = finders.new_async_job({
          "--hidden",
          "--no-ignore",
          command_generator = function(prompt)
            if not prompt or prompt == "" then
              return nil
            end

            local pieces = vim.split(prompt, "  ")
            local args = { "rg" }
            if pieces[1] then
              table.insert(args, "-e")
              table.insert(args, pieces[1])
            end

            if pieces[2] then
              table.insert(args, "-g")
              table.insert(args, pieces[2])
            end

            ---@diagnostic disable-next-line: deprecated
            return vim.tbl_flatten({
              args,
              { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
            })
          end,
          entry_maker = make_entry.gen_from_vimgrep(opts),
          cwd = opts.cwd,
        })

        pickers
          .new(opts, {
            debounce = 100,
            prompt_title = "Multi Grep",
            finder = finder,
            previewer = conf.grep_previewer(opts),
            sorter = require("telescope.sorters").empty(),
          })
          :find()
      end

      vim.keymap.set("n", "<leader>fg", live_multigrep)
    '';

    settings = {
      pickers = {
        extensions.fzf = { };
      };

      defaults = {
        file_ignore_patterns = [
          ".cargo"
          ".direnv"
          ".git"
          ".npm"
          ".rustup"
          ".toolchain"
          "node_modules"
          "target"
          "%.lock"
        ];
      };
    };
  };
}
