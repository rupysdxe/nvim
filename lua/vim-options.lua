local opt = vim.opt

opt.ignorecase = true
vim.cmd("set expandtab")
opt.smartcase = true
opt.incsearch = true
opt.mouse = ""
opt.updatetime = 250
opt.cursorline = true
vim.bo.spelllang = "en_us"
opt.showtabline = 2
opt.encoding = "UTF-8"
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>sh", ":sp<CR>")
vim.keymap.set("n", "<leader>sv", ":vsp<CR>")
vim.wo.number = true
vim.opt.swapfile = false -- This disables swap file creation.

vim.api.nvim_set_option("clipboard", "unnamedplus")

vim.keymap.set("n", "t", ":wincmd w<CR>")
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*.py,*.js,*.sh,*.xml,*.java,*.lua,*.cpp,*.html,*.css,*.jsx,*.tsx,*.ts,*.json",
  callback = function()
    vim.cmd("write")
  end,
})
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    if vim.fn.isdirectory(vim.fn.argv()[1]) == 1 then
      vim.cmd("Neotree filesystem reveal left")
    end
  end,
})
vim.g.netrw_banner = 0
vim.api.nvim_set_keymap("n", "tn", ":tabnew<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "tc", ":tabclose<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "]", ":tabnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[", ":tabprev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "qq", ":q!<CR>", { noremap = true, silent = true })


function RunJava()
  local fileName = vim.fn.expand("%:p")
  vim.cmd("startinsert | rightbelow vsplit | term javac " .. fileName .. " && java " .. fileName)
end

function RunCp()
  local fileName = vim.fn.expand("%:p")
  vim.cmd("startinsert | rightbelow vsplit | term g++ " .. fileName .. " -o out && ./out")
end

vim.api.nvim_set_keymap("n", "cc", ":lua RunCp()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "rj", ":lua RunJava()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "ff", function()
  vim.lsp.buf.format({ async = true })
end)
vim.api.nvim_exec([[
  autocmd BufWritePost * :w
]], false)
