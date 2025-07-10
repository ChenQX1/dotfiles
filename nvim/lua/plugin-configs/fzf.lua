local status_ok, fzf_lua = pcall(require, "fzf-lua")
if not status_ok then
	vim.notify("fzf-lua not found!")
	return
end

-- Optional: You can call setup if you want to override defaults later
-- fzf_lua.setup({})
-- Ensure 'opt' is defined as in your previous examples, e.g.:
-- local opt = { noremap = true, silent = true }
-- Or define options directly in the mapping.

vim.keymap.set("n", "<C-p>", function()
	require("fzf-lua").files()
end, { noremap = true, silent = true, desc = "FZF Find Files" })

-- For live grep (similar to Telescope live_grep)
vim.keymap.set("n", "<C-f>", function()
	require("fzf-lua").live_grep()
end, { noremap = true, silent = true, desc = "FZF Live Grep" })

-- Some other useful fzf-lua commands you might want to map:
-- vim.keymap.set("n", "<leader>fb", function() require('fzf-lua').buffers() end, { noremap = true, silent = true, desc = "FZF Buffers" })
-- vim.keymap.set("n", "<leader>fh", function() require('fzf-lua').help_tags() end, { noremap = true, silent = true, desc = "FZF Help Tags" })
-- vim.keymap.set("n", "<leader>fo", function() require('fzf-lua').oldfiles() end, { noremap = true, silent = true, desc = "FZF Old Files" })
-- vim.keymap.set("n", "<leader>fc", function() require('fzf-lua').commands() end, { noremap = true, silent = true, desc = "FZF Commands" })
