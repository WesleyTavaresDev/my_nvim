require('mason').setup()
require('neodev').setup({
		library = { plugins = { "nvim-dap-ui" }, types = true },
})

local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
				'force',
				lsp_defaults.capabilities,
				require('cmp_nvim_lsp').default_capabilities()
		)


require("mason-lspconfig").setup_handlers {
		-- The first entry (without a key) will be the default handler
		-- and will be called for each installed server that doesn't have
		-- a dedicated handler.
		function(server_name) -- default handler (optional)
			require("lspconfig")[server_name].setup {}
		end,
		-- Next, you can provide a dedicated handler for specific servers.
		-- For example, a handler override for the `rust_analyzer`:
}

--[[lspconfig.omnisharp.setup {
		capabilities = require('cmp_nvim_lsp').default_capabilities(),
		on_attach = function(_, bufnr)
			vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
		end,
}		cmd = { "/usr/local/bin/Omnisharp/OmniSharp", "--languageserver", "--hostPID", tostring(pid) },
--]]
--[[lspconfig.sumneko_lua.setup({
  single_file_support = true,
  flags = {
    debounce_text_changes = 150,
  },
})-<-]]
