vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	local use = use;

	use 'wbthomason/packer.nvim'

	use "rebelot/kanagawa.nvim"
	use 'RRethy/nvim-base16'
	use 'OmniSharp/omnisharp-vim'
	use 'romgrk/barbar.nvim'
	use 'nvim-lualine/lualine.nvim'
	use 'nvim-tree/nvim-web-devicons'
	use { 'michaelb/sniprun', run = 'bash ./install.sh' }
	use 'f-person/git-blame.nvim'
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	use { "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*", run = " make install_jsregexp" }

	--Autocompletition_nvim_CPM
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdLine',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp-document-symbol',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'petertriho/cmp-git',
			'onsails/lspkind-nvim',
			'chrisgrieser/cmp-nerdfont',
		},
	}

	--Mason and LSP
	use {
		'neovim/nvim-lspconfig',
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'j-hui/fidget.nvim',
		'folke/neodev.nvim',
		'jose-elias-alvarez/null-ls.nvim',
	}

	--Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' },
			{ 'nvim-telescope/telescope-fzf-native.nvim',
				run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
		},
	}

	--Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
	--NeoVim Tree
	use {
		'nvim-tree/nvim-tree.lua',
		tag = 'nightly'
	}

end)
