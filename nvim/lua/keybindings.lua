-- Fundamentals
vim.g.mapleader = ","
vim.g.maplocalleader = ","
local pluginKeys = {}
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
-- Editors
map("n", "<C-q>", ":q<CR>", opt)
map("n", "<C-s>", ":w<CR>", opt)
map("n", "<C-j>", "5j", opt)
map("n", "<C-k>", "5k", opt)
-- Move selected words
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)
-- Fold/unfold
map("n", "<Space>", [[@=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>]], opt)
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

-- COC
function _G.check_back_space()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end
map("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<C-g>u<Tab>"]], opts)
map("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<C-h>"]], opts)
-- map("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
-- map("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
map("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
-- Use <c-j> to trigger snippets
map("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)", { silent = true, expr = true })
-- GoTo code navigation
map("n", "gd", "<Plug>(coc-definition)", { silent = true })
map("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
map("n", "gi", "<Plug>(coc-implementation)", { silent = true })
map("n", "gr", "<Plug>(coc-references)", { silent = true })
-- Use K to show documentation in preview window
function _G.show_docs()
	local cw = vim.fn.expand("<cword>")
	if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
		vim.api.nvim_command("h " .. cw)
	elseif vim.api.nvim_eval("coc#rpc#ready()") then
		vim.fn.CocActionAsync("doHover")
	else
		vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
	end
end
map("n", "K", "<CMD>lua _G.show_docs()<CR>", { silent = true })
-- Symbol renaming
map("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })

-- Formatter
map("n", "<leader>f", ":Format<CR>", opt)
map("n", "<leader>F", ":FormatWrite<CR>", opt)

-- NvimTree
map("n", "<leader>m", ":NvimTreeToggle<CR>", opt)
pluginKeys.nvimTreeList = {
	-- Open a file
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	-- Open a file in a split window
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	-- Show filtered files
	{ key = "i", action = "toggle_custom" },
	{ key = ".", action = "toggle_dotfiles" },
	-- Editor ops
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

-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)

return pluginKeys
