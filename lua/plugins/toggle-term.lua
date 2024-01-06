return {
  "akinsho/toggleterm.nvim",
  config = function()
    local toggleterm = require("toggleterm")
    toggleterm.setup({
      -- size can be a number or function which is passed the current terminal
      size = 20,
      open_mapping = [[<c-\>]], -- keymap to open terminals
      hide_numbers = true,      -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,       -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      start_in_insert = true,
      insert_mappings = true,   -- whether or not the open mapping applies in insert mode
      persist_size = true,
      direction = 'horizontal', -- 'vertical' | 'horizontal' | 'window' | 'float',
      close_on_exit = true,     -- close the terminal window when the process exits
      shell = vim.o.shell,      -- change the default shell
      -- This field is only relevant if direction is set to 'float'
      float_opts = {
        border = 'curved', -- 'single' | 'double' | 'shadow' | 'curved'
        width = 80,
        height = 16,
        backjjjkj
      }
    })
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }
    map('n', '<leader>tt', ':ToggleTerm direction=tab<CR>', opts)
    map('n', '<leader>tf', ':ToggleTerm direction=float<CR>', opts)
  end,

}
