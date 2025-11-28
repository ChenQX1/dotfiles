local status_ok, fzf_lua = pcall(require, "fzf-lua")
if not status_ok then
	vim.notify("fzf-lua not found!")
	return
end

-- 1. SETUP: Configure the look and feel of the window
fzf_lua.setup({
	winopts = {
		height = 0.85, -- Window height
		width = 0.80, -- Window width
		preview = {
			layout = "horizontal", -- "horizontal" or "vertical"
			scrollbar = "float",
		},
	},
	keymap = {
		-- These override the default internal FZF keys
		builtin = {
			-- Use Ctrl-j and Ctrl-k to move up and down inside the list
			["<C-j>"] = "down",
			["<C-k>"] = "up",

			-- Scroll the preview window
			["<C-u>"] = "preview-page-up",
			["<C-d>"] = "preview-page-down",
		},
		fzf = {
			-- FZF native keybindings (optional)
			["ctrl-z"] = "abort",
		},
	},
})

-- 2. KEYMAPPINGS: Open the search windows
-- We use vim.keymap.set which is the modern Lua way to set keys
local map = vim.keymap.set
local opts = { noremap = true, silent = true, desc = "FZF" }

-- <C-p>: Find Files
map("n", "<C-p>", function()
	fzf_lua.files()
end, { desc = "FZF Find Files" })

-- <C-f>: Live Grep (Content Search)
map("n", "<C-f>", function()
	fzf_lua.live_grep()
end, { desc = "FZF Live Grep" })

-- Extra: <C-b> to search open Buffers (very useful!)
map("n", "<leader>b", function()
	fzf_lua.buffers()
end, { desc = "FZF Find Buffers" })
