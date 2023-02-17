vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	local use = use

	use("rafamadriz/friendly-snippets")
	use("lukas-reineke/indent-blankline.nvim")
	use("wbthomason/packer.nvim")
	-- themes
	use("morhetz/gruvbox")
	use("sainnhe/everforest")
	use("sainnhe/edge")
	use({ "catppuccin/nvim" })
	use("rebelot/kanagawa.nvim")
	use("folke/tokyonight.nvim")
	use("shaunsingh/nord.nvim")

	use("romgrk/barbar.nvim")
	use("nvim-lualine/lualine.nvim")
	use("nvim-tree/nvim-web-devicons")
	use({ "michaelb/sniprun", run = "bash ./install.sh" })
	use("f-person/git-blame.nvim")
	use("cdelledonne/vim-cmake")
	-- Debug
	use({
		"mfussenegger/nvim-dap",
		requires = {
			"David-Kunz/jester",
			"rcarriga/cmp-dap",
			"rcarriga/nvim-dap-ui",
			"leoluz/nvim-dap-go",
		},
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use({
		"L3MON4D3/LuaSnip",
		tag = "v<CurrentMajor>.*",
		run = " make install_jsregexp",
	})

	use({
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	})
	-- Lua
	use("ahmedkhalf/project.nvim")
	-- Autocompletition_nvim_CPM
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdLine",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"petertriho/cmp-git",
			"onsails/lspkind-nvim",
			"chrisgrieser/cmp-nerdfont",
		},
	})

	-- Mason and LSP
	use({
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"j-hui/fidget.nvim",
		"folke/neodev.nvim",
		"jose-elias-alvarez/null-ls.nvim",
		"jay-babu/mason-null-ls.nvim",
		"jay-babu/mason-nvim-dap.nvim",
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.x",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
		},
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({
				with_sync = true,
			})
			ts_update()
		end,
	})
	-- NeoVim Tree
	use({ "nvim-tree/nvim-tree.lua", tag = "nightly" })

	-- navigation;
	use({
		"numToStr/Navigator.nvim",
		config = function()
			require("Navigator").setup()
		end,
	})
	-- tmux
	use({
		"aserowy/tmux.nvim",
		config = function()
			return require("tmux").setup()
		end,
	})
	-- markdown
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- notification
	use({
		"folke/noice.nvim",
		requires = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim", -- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	})
	--  Float term
	use({ "akinsho/toggleterm.nvim", tag = "*" })
end)
