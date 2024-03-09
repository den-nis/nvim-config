---@diagnostic disable: undefined-global

-- Show line diagnostics automatically in hover window
--vim.o.updatetime = 250
--vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Custom commands
local suggest_cmd = function() pcall(function() vim.lsp.buf.code_action() end) end
local definition_cmd = function() pcall(function() vim.lsp.buf.definition() end) end
local docs_cmd = function() pcall(function() vim.lsp.buf.hover() end) end

vim.api.nvim_create_user_command('Suggest', suggest_cmd, {nargs = 0, desc = "Get a code suggestion" })
vim.api.nvim_create_user_command('Definition', definition_cmd, {nargs = 0, desc = "Go to the definition" })
vim.api.nvim_create_user_command('Docs', docs_cmd, {nargs = 0, desc = "Show signature help"})

vim.api.nvim_create_user_command('Ec', function() vim.cmd('e %:p:h') end, {nargs = 0, desc = "Show signature help"})
