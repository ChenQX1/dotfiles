-- utf8
vim.opt.encoding = "utf-8"
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"
-- Keep 8 lines when moving cursor
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.wo.number = true
vim.wo.relativenumber = true
-- Highlight cursor line
vim.wo.cursorline = true
-- Show the sign column on left
vim.wo.signcolumn = "yes"
vim.opt.signcolumn = "yes"
vim.wo.colorcolumn = "80"
-- Set <Tab> = 4 <spaces>
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
-- >> << shift distance
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
-- Repalce <tab> by <space>
-- vim.o.expandtab = true
-- vim.bo.expandtab = true
-- About indent
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- Ignore cases when searching
vim.o.ignorecase = true
vim.o.smartcase = true
-- Disable highlight
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.cmdheight = 2
-- Auto-reload file if it is changed
vim.o.autoread = true
vim.bo.autoread = true
-- Disable fold
vim.wo.wrap = false
-- Use <Left><Right> to jump at both ends
vim.o.whichwrap = "<,>,[,]"
-- Hide buffers without saving them
vim.o.hidden = true
-- The buffer stays loaded even if its not displayed in a window
vim.opt.bufhidden = "hide"
vim.o.mouse = "a"
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- Smaller updatetime
vim.o.updatetime = 300
vim.o.timeoutlen = 300
-- Split window
vim.o.splitbelow = true
vim.o.splitright = true
-- Dont select for auto-completion
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- Theme
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
vim.o.filetype = "on"
vim.o.syntax = "on"
-- How to show unseen characters
-- Map space to a dot
vim.o.list = false
vim.o.listchars = "space:·"
-- Enhance auto-completion
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. "c"
-- Popup window height
vim.o.pumheight = 10
-- Always show the tabline
vim.o.showtabline = 2
-- Disable showmode of vim
-- since we have Lualine
vim.o.showmode = false
-- Enable the system clipboard
vim.opt.clipboard:append("unnamedplus")
-- Ensure that special characters are treated as such in regular expressions.
vim.o.magic = true
vim.o.laststatus = 2
-- Errors
vim.o.errorbells = false
vim.o.visualbell = false

if vim.fn.has("autocmd") == 1 then
	vim.cmd([[
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  ]])
end
