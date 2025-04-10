return { -- This file contains plugins that help me navigate/edit files faster.

	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ignore = "^$",
		},
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	{
		"junegunn/vim-easy-align",
		enabled = true,
		keys = {
			{ "ga", mode = { "x", "n" }, "<Plug>(EasyAlign)", desc = "Easy allign" },
		},
	},
}
