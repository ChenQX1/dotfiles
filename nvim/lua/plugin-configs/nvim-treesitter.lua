local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	vim.notify("nvim-treesitter not found!")
	return
end

treesitter.setup({
	-- Use `:TSInstallInfo` to check info
	ensure_installed = {
		"json",
		"html",
		"css",
		"vim",
		"lua",
		"javascript",
		"typescript",
		"tsx",
		"c",
		"cpp",
		"python",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			node_decremental = "<BS>",
			scope_incremental = "<TAB>",
		},
	},
	indent = {
		enable = true,
	},
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99
