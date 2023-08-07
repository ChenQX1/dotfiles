local packer = require("packer")

packer.startup({
	function(use)
		-- Plugin List
		use("wbthomason/packer.nvim")
		use({ "neoclide/coc.nvim", branch = "release" })
		use("mhartington/formatter.nvim")
		use("shaunsingh/nord.nvim")
		use("sainnhe/everforest")
		--use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
		use({ "nvim-tree/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })
		use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
		use({
			"nvim-treesitter/nvim-treesitter",
			run = function()
				local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
				ts_update()
			end,
		})
		use("nvim-lua/plenary.nvim")
		use("Raimondi/delimitMate")
		use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
		use("numToStr/Comment.nvim")
		use("lukas-reineke/indent-blankline.nvim")
		use("voldikss/vim-floaterm")
	end,
	config = {
		-- 并发数限制
		max_jobs = 16,
		-- 自定义源
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

-- 每次保存 plugins.lua 自动安装插件
-- Call vim auto API
pcall(
	vim.cmd,
	[[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
