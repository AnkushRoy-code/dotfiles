return {
	'brenoprata10/nvim-highlight-colors',

	config = function()
		-- Ensure termguicolors is enabled if not already
		vim.opt.termguicolors = true

		require('nvim-highlight-colors').setup({
			render = 'background',
			enable_named_colors = true,
			enable_tailwind = false,
		})
	end
}
