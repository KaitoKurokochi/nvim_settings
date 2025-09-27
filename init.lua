vim.opt.number = true
vim.cmd("highlight LineNr ctermfg=DarkGray")
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard:append("unnamedplus")

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.belloff = "all"

vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>O", { noremap = true })

vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.equalalways = false

--  lazy
require("config.lazy")

-- for colorscheme
vim.o.background = "dark"
vim.cmd.colorscheme "catppuccin-mocha"

-- Make background fully transparent
vim.cmd [[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
  highlight LineNr guibg=#313244
  highlight SignColumn guibg=#313244
  "highlight LineNr guibg=NONE
  "highlight SignColumn guibg=NONE
  highlight VertSplit guibg=NONE
  highlight FloatBorder guifg=#a9b1d6 guibg=NONE
]]

-- for nvimtree 
vim.keymap.set("n", "<C-h>", "<cmd>bprev<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>bnext<CR>")

-- for C++
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.keymap.set("i", "ccc", "/*  */<ESC>3ha", { noremap = true, buffer = true })
    vim.keymap.set("i", "yyy", "cout << \"Yes\" << endl;<ESC>", { noremap = true, buffer = true })
    vim.keymap.set("i", "nnn", "cout << \"No\" << endl;<ESC>", { noremap = true, buffer = true })
    vim.keymap.set("i", "aaa", "cout << ans << endl;<ESC>", { noremap = true, buffer = true })
  end,
})
-- off cmp
local cmp = require'cmp'
cmp.setup.filetype('cpp', {
  enabled = false
})

-- for markdown --
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = [[getline(v:lnum) =~ '^#' ? '>' . len(matchstr(getline(v:lnum), '^#*')) : '=']]
    vim.opt_local.foldenable = true
    vim.opt_local.foldlevel = 99  
  end,
})
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.md",
  callback = function()
    vim.cmd("normal! zM")  
  end,
})
-- preview 
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_math = 1

-- for spell checker (only in markdown) --
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.cmd("setlocal spell spelllang=en_us")
  end,
})

-- for diagnostic
vim.keymap.set('n', '<leader>d', function()
  vim.diagnostic.open_float(nil, { focus = true, border = "rounded"})
end, { desc = 'Show diagnostics under cursor' })

-- open a screenshot in quicklook 
vim.keymap.set("n", "<leader>o", function()
  local line = vim.fn.getline(".")
  local path = line:match("%!%[.-%]%((.-)%)")
  if not path then return end

  local base_dir = vim.fn.expand("%:p:h")
  local abs_path = vim.fn.fnamemodify(base_dir .. "/" .. path, ":p")
  if vim.fn.filereadable(abs_path) == 0 then return end

  vim.fn.jobstart({ "qlmanage", "-p", abs_path }, { detach = true })
end)

