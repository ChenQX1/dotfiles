local packer = require("packer")

packer.startup({
	function(use)
		-- Plugin List
		use("wbthomason/packer.nvim")
		use({ "neoclide/coc.nvim", branch = "release" })
		use("shaunsingh/nord.nvim")
		use("sainnhe/everforest")
		use("mhartington/formatter.nvim")
		use({ "nvim-tree/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })
		use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
		use({ "famiu/bufdelete.nvim" })
		use({
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = function()
				require("nvim-autopairs").setup({})
			end,
		})
		--use({ "lukas-reineke/indent-blankline.nvim", main = "ibl" })
		use("voldikss/vim-floaterm")
		--use("preservim/nerdcommenter")
		use({ "ibhagwan/fzf-lua", requires = { "nvim-tree/nvim-web-devicons" } })
		use("antoinemadec/coc-fzf")
		use({
			"nvim-treesitter/nvim-treesitter",
			run = function()
				local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
				ts_update()
			end,
		})
	end,
	config = {
		max_jobs = 16,
		-- Github proxies
		git = {
			-- default_url_format = "https://hub.fastgit.xyz/%s",
			-- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
			-- default_url_format = "https://gitcode.net/mirrors/%s",
			-- default_url_format = "https://gitclone.com/github.com/%s",
		},
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})

-- Auto install/sync plugins
-- upon saving plugins.lua

--[[pcall(]]
--[[vim.cmd,]]
--[[[[]]
--[[augroup packer_user_config]]
--[[autocmd!]]
--[[autocmd BufWritePost plugins.lua source <afile> | PackerSync]]
--[[augroup end]]
---[[]]]]
--[[)]]
