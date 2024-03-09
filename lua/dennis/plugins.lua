---@diagnostic disable: undefined-global

return {
	{
		"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
        	opts = {
        		ensure_installed = { "c", "lua", "rust", "c_sharp", "css", "javascript", "html" }
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
		opts = {
			defaults = {
				file_ignore_patterns = { "node_modules", "dist" },
			}
		}
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		}
	},
	{
    		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		opts = {
			ensure_installed = { "lua_ls", "rust_analyzer", "csharp_ls", "tsserver", "cssls", "html" }
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
			lspconfig.tsserver.setup({});
			lspconfig.cssls.setup({});
			lspconfig.html.setup({});

			vim.diagnostic.config({
				virtual_text = false
			})
		end
    	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()
		end
	}
}
