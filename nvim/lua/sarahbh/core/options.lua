vim.cmd("let g:netrw_liststyle = 3") --tree file system option

local opt = vim.opt --use more concise syntax

opt.relativenumber = true --shows relative line #s in buffers
opt.number = true --shows absolute line # for current line


-- tabs & indentation
opt.tabstop = 2 --2 spaces for tabs (prettier default)
opt.shiftwidth = 2 --2 spaces for indent width
opt.expandtab = true --expand tab to be spaces
opt.autoindent = true --copy indent from current line when starting a new one

--opt.wrap = false --disable line wrapping



-- search settings
opt.ignorecase = true
opt.smartcase = true --if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true --adds line under cursor



-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" --colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" --show sign column so that text doesn't shift



-- backspace
opt.backspace = "indent,eol,start" --allow backspace on indent, end of line or insert mode start position



-- clipboard
opt.clipboard:append("unnamedplus") --use system clipboard as default register



-- split windows
opt.splitright = true --split vertical window to the right
opt.splitbelow = true --split horizontal window to the bottom
