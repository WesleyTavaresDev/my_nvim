--Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>ff', builtin.find_files, {})
vim.keymap.set('n', '<space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<C>kt', builtin.colorscheme, {})
vim.keymap.set('n', '<space>t', builtin.treesitter, {})

--nvim-tree
local api = require('nvim-tree.api')
vim.keymap.set('n', '<Tab>a', api.tree.open, {})
vim.keymap.set('n', '<Tab>t', api.tree.toggle, {})
vim.keymap.set('n', '<Tab>f', api.tree.focus, {})

