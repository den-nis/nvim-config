---@diagnostic disable: undefined-global
return {
	{
		"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
        	opts = {
        		ensure_installed = { "c", "lua", "rust", "c_sharp" }
        	},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd('colorscheme tokyonight')
		end

	},
    	{
		"nvim-telescope/telescope.nvim",
		tag = '0.1.5',
		dependencies = {
			'nvim-lua/plenary.nvim'
		},
		config = function()
			-- Setup telescope
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		end
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			vim.keymap.set('n', '<C-d>', function() vim.cmd("Neotree filesystem reveal right") end)
		end
	},
	{
    		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		opts = {
			ensure_installed = { "lua_ls", "rust_analyzer", "csharp_ls" }
		},
    		"williamboman/mason-lspconfig.nvim",
    	},
	{
    		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.rust_analyzer.setup({})
			lspconfig.csharp_ls.setup({})

			vim.keymap.set('n', '<C-i>', vim.lsp.buf.hover, {})

			vim.diagnostic.config({
				virtual_text = false
			})

			-- Show line diagnostics automatically in hover window
			--vim.o.updatetime = 250
			--vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
			vim.keymap.set('n', '<leader><leader>', function() vim.diagnostic.open_float(nil, {focus=false}) end)
			vim.keymap.set('n', '<leader>d', function() vim.lsp.buf.hover() end)

			-- Custom commands
			local suggest_cmd = function() pcall(function() vim.lsp.buf.code_action() end) end
			local definition_cmd = function() pcall(function() vim.lsp.buf.definition() end) end
			local docs_cmd = function() pcall(function() vim.lsp.buf.hover() end) end

			vim.api.nvim_create_user_command('Suggest', suggest_cmd, {nargs = 0, desc = "Get a code suggestion" })
			vim.api.nvim_create_user_command('Definition', definition_cmd, {nargs = 0, desc = "Go to the definition" })
			vim.api.nvim_create_user_command('Docs', docs_cmd, {nargs = 0, desc = "Show signature help"})

		end
    	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():append()
				vim.print("Added to harpoon list (open list with <C-e>)")
			end)
			vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

			vim.keymap.set("n", "<C-0>", function() harpoon:list():select(1) end)
			vim.keymap.set("n", "<C-9>", function() harpoon:list():select(2) end)
			vim.keymap.set("n", "<C-8>", function() harpoon:list():select(3) end)
			vim.keymap.set("n", "<C-7>", function() harpoon:list():select(4) end)

			-- Toggle previous & next buffers stored within Harpoon list
			vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
			vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

		end
	}
}
