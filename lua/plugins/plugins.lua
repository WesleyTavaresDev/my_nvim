vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	local use = use

	use("OmniSharp/omnisharp-vim")
	use("rafamadriz/friendly-snippets")
	use("lukas-reineke/indent-blankline.nvim")
	use("wbthomason/packer.nvim")
	-- themes
	use("AlexvZyl/nordic.nvim")
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

	--  Buffer line
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
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

	-- Rest
	use({
		"rest-nvim/rest.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("rest-nvim").setup({
				-- Open request results in a horizontal split
				result_split_horizontal = false,
				-- Keep the http file buffer above|left when split horizontal|vertical
				result_split_in_place = false,
				-- Skip SSL verification, useful for unknown certificates
				skip_ssl_verification = false,
				-- Encode URL before making request
				encode_url = true,
				-- Highlight request on run
				highlight = {
					enabled = true,
					timeout = 150,
				},
				result = {
					-- toggle showing URL, HTTP info, headers at top the of result window
					show_url = true,
					show_http_info = true,
					show_headers = true,
					-- executables or functions for formatting response body [optional]
					-- set them to false if you want to disable them
					formatters = {
						json = "jq",
						html = function(body)
							return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
						end,
					},
				},
				-- Jump to request line on run
				jump_to_request = false,
				env_file = ".env",
				custom_dynamic_variables = {},
				yank_dry_run = true,
			})
		end,
	})
	-- Trouble
	use("folke/trouble.nvim")

	-- TODO
	use("folke/todo-comments.nvim")
	use({ "sindrets/diffview.nvim" })
	use("lukas-reineke/cmp-under-comparator")
	use({ "fgheng/winbar.nvim" })
	use({
		"vhyrro/neorg",
		config = function()
			require("config.neorg").setup()
		end,
		requires = "nvim-lua/plenary.nvim",
	})
end)
