local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	vim.notify("nvim-tree not found!")
	return
end

local list_keys = require("keybindings").nvimTreeList
nvim_tree.setup({
	-- Disable Git icon
	git = {
		enable = false,
	},
	-- Project plugin
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	-- Hide files and folders
	filters = {
		dotfiles = true,
		custom = { "node_modules", "__pycache__" },
	},
	view = {
		width = 40,
		side = "left",
		hide_root_folder = false,
		mappings = {
			custom_only = false,
			list = list_keys,
		},
		-- Disable line numbers
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
	renderer = {
		group_empty = true,
	},
	actions = {
		open_file = {
			resize_window = true,
			-- Set to false
			-- otherwise, cannot open the folder
			quit_on_open = false,
		},
	},
	-- wsl install -g wsl-open
	-- https://github.com/4U6U57/wsl-open/
	-- Set as "wsl-open" for WSL
	system_open = {
		cmd = "open",
	},
})
