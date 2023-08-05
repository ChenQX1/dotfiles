vim.g.mapleader = ","
vim.g.maplocalleader = ","
local pluginKeys = {}
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

map("n", "<C-q>", ":q<CR>", opt)
map("n", "<C-s>", ":w<CR>", opt)
map("n", "<Space>", [[@=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>]], { noremap = true, silent = true })
-- Press i to enter insert mode, and ii to exit insert mode.
-- And so on
map("i", "ii", "<Esc>", opt)
map("i", "jk", "<Esc>", opt)
map("i", "kj", "<Esc>", opt)
map("v", "jk", "<Esc>", opt)
map("v", "kj", "<Esc>", opt)

map("n", "dd", '"_dd', opt)
map("x", "dd", '"_dd', opt)
map("n", "dw", '"_dw', opt)
map("x", "dw", '"_dw', opt)

-- COC Intellisence
function _G.check_back_space()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end
map("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<C-g>u<Tab>"]], { expr = true, noremap = true, silent = true })
map("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<C-h>"]], { expr = true, noremap = true })
-- map("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
-- map("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
map("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
-- COC
map("n", vim.g.mapleader .. "rn", "<Plug>(coc-rename)", {})

-- Formatter
map("n", "<leader>f", ":Format<CR>", opt)
map("n", "<leader>F", ":FormatWrite<CR>", opt)

-- NvimTree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
pluginKeys.nvimTreeList = {
	-- 打开文件或文件夹
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	-- 分屏打开文件
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	-- 显示隐藏文件
	{ key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
	{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
	-- 文件操作
	{ key = "<F5>", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "s", action = "system_open" },
}

--- bufferline
--- Switch between tabs
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
--- close tabs
map("n", "<C-w>w", ":Bdelete!<CR>", opt)
--map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)      --- close the right tab
--map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)     --- close the left tab
--map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)     --- close the selected tab

return pluginKeys
