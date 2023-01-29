vim.g.mapleader = ','
vim.g.maplocalleader = ','

local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

map('n', '<C-q>', ':q<CR>', opt)
map('n', '<C-s>', ':w<CR>', opt)

--- split windows
map('n', 's', '', opt)
map('n', 'sv', ':vsp<CR>', opt)
map('n', 'sh', ':sp<CR>', opt)
--- resize windows
--map("n", "<C-l>", ":vertical resize -2<CR>", opt)
--map("n", "<C-h>", ":vertical resize +2<CR>", opt)
--map("n", "<C-k>", ":resize +2<CR>", opt)
--map("n", "<C-j>", ":resize -2<CR>", opt)

local pluginkeys = {}

--- nvim-tree
map('n', '<S-q>', ':NvimTreeToggle<CR>', opt)
pluginkeys.nvimTreeList = {
    {key = {'<CR>', 'o', '<2-LeftMouse>'}, action = 'edit'},
    {key = 'v', action = 'vsplit'},
    {key = 'h', action = 'split'},
    {key = '.', action = 'toggle_dotfiles'},
    {key = '<leader>rn', action = 'rename'},
    {key = 'r', action = 'refresh'},
    {key = '<leader>a', action = 'create'},
    {key = '<leader>d', action = 'remove'}
}

--- bufferline
--- switch between tabs
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)

--- close tabs
map("n", "<C-w>w", ":Bdelete!<CR>", opt)     --- close
--map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)      --- close the right tab
--map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)     --- close the left tab
--map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)     --- close the selected tab

--- telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt)     --- search files
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)    --- global search
pluginkeys.telescopeList = {
  i = {
    -- move vertically
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- history
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- close the window
    ["<C-c>"] = "close",
    -- sroll the preview window
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

--- Flutter
map("n", "<leader>fe", ":CocCommand flutter.emulators<CR>", opt)
map("n", "<leader>fd", ":below new output:///flutter-dev<CR>", opt)
map("n", "<leader>fr", ":CocCommand flutter.run<CR>", opt)

--- Markdown
vim.g.nvim_markdown_preview_format = 'markdown'
map("n", "<leader>md", ":MarkdownPreview<CR>", opt)


return pluginkeys
