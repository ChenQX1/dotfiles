local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	vim.notify("nvim-tree not found!")
	return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local list_keys = require("keybindings").nvimTreeList

local function custom_on_attach(bufnr)
	local api = require("nvim-tree.api")

	-- Helper function to make mapping easier
	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
	-- Open files
	vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "v", api.node.open.vertical, opts("Open in Vertical Split"))
	vim.keymap.set("n", "h", api.node.open.horizontal, opts("Open in Horizontal Split")) -- 's' is also common for split

	-- Toggle visibility
	-- For 'toggle_custom', this usually refers to custom filters like 'node_modules'.
	-- 'api.tree.toggle_custom_filter()' or 'api.tree.toggle_ignored_filter()' are candidates.
	-- Let's assume 'toggle_custom_filter' for your 'node_modules' example.
	vim.keymap.set("n", "i", api.tree.toggle_custom_filter, opts("Toggle Custom Filter (e.g., node_modules)"))
	vim.keymap.set("n", ".", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles")) -- 'H' is the default

	-- Tree operations
	vim.keymap.set("n", "r", api.tree.reload, opts("Refresh"))

	-- Filesystem operations
	vim.keymap.set("n", "<Leader>a", api.fs.create, opts("Create File/Directory"))
	vim.keymap.set("n", "<Leader>d", api.fs.remove, opts("Delete File/Directory"))
	vim.keymap.set("n", "<Leader>rn", api.fs.rename, opts("Rename"))
	vim.keymap.set("n", "<Leader>x", api.fs.cut, opts("Cut"))
	vim.keymap.set("n", "<Leader>c", api.fs.copy.node, opts("Copy")) -- api.fs.copy.node for files/dirs
	vim.keymap.set("n", "<Leader>p", api.fs.paste, opts("Paste"))
	-- vim.keymap.set("n", "<Leader>s", api.fs.system_open, opts("System Open"))

	-- You can add other mappings from the defaults or new custom ones:
	-- vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
	-- vim.keymap.set('n', 'P', api.node.navigate.parent_close, opts('Parent Directory and Close Children'))
	-- vim.keymap.set('n', 'J', api.node.navigate.sibling.next, opts('Next Sibling'))
	-- vim.keymap.set('n', 'K', api.node.navigate.sibling.prev, opts('Previous Sibling'))
end

nvim_tree.setup({
	-- Disable Git icon
	git = { enable = false },
	-- Project plugin
	update_cwd = true,
	sync_root_with_cwd = true,
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
		width = 30,
		side = "left",
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
	renderer = {
		group_empty = true,
		root_folder_label = false,
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
	on_attach = custom_on_attach,
})
