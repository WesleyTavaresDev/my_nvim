local tree = require('nvim-treesitter.configs')

tree.setup {
	ensure_installed = { "lua", "c", "help", "vim", "c_sharp", "json", "java", "html", "css", "markdown"},

	sync_install = false,
  
	auto_install = true,

  
	highlight = {
    
	  enable = true,
  
	},
  incremental_selection = { enable = true },
  textobjects = { enable = true },
  indent = { enable = true },
}
