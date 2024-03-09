---@diagnostic disable: undefined-global

vim.keymap.set('n', '<C-d>', function() vim.cmd('Neotree filesystem toggle right') end)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Lsp
vim.keymap.set('n', '<leader><leader>', function() vim.diagnostic.open_float(nil, {focus=false}) end)
vim.keymap.set('n', '<leader>d', function() vim.lsp.buf.hover() end)
vim.keymap.set('n', '<C-i>', vim.lsp.buf.hover, {})

-- Harpoon
local harpoon = require('harpoon')
vim.keymap.set('n', '<leader>a', function() harpoon:list():append() end)

vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set('n', '<C-h>', function() harpoon:list():select(1) end)
vim.keymap.set('n', '<C-j>', function() harpoon:list():select(2) end)
vim.keymap.set('n', '<C-k>', function() harpoon:list():select(3) end)
vim.keymap.set('n', '<C-l>', function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<C-S-P>', function() harpoon:list():prev() end)
vim.keymap.set('n', '<C-S-N>', function() harpoon:list():next() end)

-- Exit terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
