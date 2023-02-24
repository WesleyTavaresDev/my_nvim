require("toggleterm").setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		elseif term.direction == "float" then
			return 35
		end
	end,
	open_mapping = [[<A-t>]],
	shade_terminals = true,
	start_in_inset = true,
	persist_mode = true,
	direction = "float",
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "float",
})

function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<A-g>", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
