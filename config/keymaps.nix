{
  config = {

    keymaps = [
      # Source and run lua code
      {
        action = "<cmd>source %<CR>";
        key = "<leader><leader>x";
        mode = [ "n" ];
      }
      {
        action = ":.lua<CR>";
        key = "<leader>x";
        mode = [
          "n"
          "v"
        ];
      }

      # Quickfix bindings
      {
        action = "<cmd>cnext<CR>";
        key = "<M-j>";
        mode = [ "n" ];
      }
      {
        action = "<cmd>cprev<CR>";
        key = "<M-k>";
        mode = [ "n" ];
      }
      {
        action = "<cmd>cclose<CR>";
        key = "<M-c>";
        mode = [ "n" ];
      }
      {
        action = "<cmd>copen<CR>";
        key = "<M-o>";
        mode = [ "n" ];
      }
      {
        action = "<cmd>lua vim.diagnostic.setqflist({severity=vim.diagnostic.severity.ERROR})<CR>";
        key = "<M-d>";
        mode = [ "n" ];
      }

      # Clear highlights on search when pressing <Esc> in normal mode
      {
        action = "<cmd>nohlsearch<CR>";
        key = "<Esc>";
        mode = [ "n" ];
      }

      # Disable arrow keys in normal mode
      {
        action = "<cmd>echo 'Use h to move!!'<CR>";
        key = "<left>";
        mode = [ "n" ];
      }
      {
        action = "<cmd>echo 'Use l to move!!'<CR>";
        key = "<right>";
        mode = [ "n" ];
      }
      {
        action = "<cmd>echo 'Use k to move!!'<CR>";
        key = "<up>";
        mode = [ "n" ];
      }
      {
        action = "<cmd>echo 'Use j to move!!'<CR>";
        key = "<down>";
        mode = [ "n" ];
      }

      # Center cursor on page up and down
      {
        action = "<C-u>zz";
        key = "<C-u>";
        mode = [ "n" ];
      }
      {
        action = "<C-d>zz";
        key = "<C-d>";
        mode = [ "n" ];
      }

      # Create smapp terminal at bottom of screen
      {
        action.__raw = ''
          function()
          	vim.cmd.vnew()
          	vim.cmd.term()
          	vim.cmd.wincmd("J")
          	vim.api.nvim_win_set_height(0, 10)
          end
        '';
        key = "<leader>st";
        mode = [ "n" ];
      }
    ];
  };
}
