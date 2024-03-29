local status, lualine = pcall(require, "lualine")
if not status then
	vim.notify("lualine not found!")
	return
end

lualine.setup({
	options = {
		theme = "nord",
		component_separators = { left = "|", right = "|" },
		-- https://github.com/ryanoasis/powerline-extra-symbols
		section_separators = { left = " ", right = "" },
	},
	extensions = { "nvim-tree", "toggleterm" },
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(str)
					return str:sub(1, 1)
				end,
			},
		},
		lualine_c = {
			"filename",
		},
		lualine_x = {
			"filesize",
			{
				"fileformat",
				-- symbols = {
				--   unix = '', -- e712
				--   dos = '', -- e70f
				mac = "", -- e711
				-- },
				symbols = {
					unix = "LF",
					dos = "CRLF",
					mac = "CR",
				},
			},
			"encoding",
			"filetype",
		},
	},
})
