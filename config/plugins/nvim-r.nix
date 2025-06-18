{
  inputs,
  pkgs,
  ...
}:
{

  config = {
    extraConfigLua = ''
      require("r").setup {
        auto_start = "on startup",
        R_args = {"--quiet", "--no-save"},
        hook = {
          on_filetype = function()
            vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
            vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
          end
        },
        min_editor_width = 72,
        rconsole_width = 78,
       }
    '';

    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "r.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "R-nvim";
          repo = "r.nvim";
          rev = "65f772c012240bc1a1706da11049d2c9801275dc";
          hash = "sha256-yAXwfwCYlzIQofY0jstydflui+AhYY85JVVmnpOh+V0=";
        };
        nvimSkipModules = [
          "r.roxygen"
          "r.format"
          "r.pdf.sumatra"
        ];
      })
    ];
  };
}
