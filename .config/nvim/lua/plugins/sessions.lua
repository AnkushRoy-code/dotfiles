return {
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup({
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			session_lens = {
				load_on_setup = true,
				theme_conf = { border = true },
				previewer = false,
			},
		})
		vim.keymap.set("n", "<leader>ls", require("auto-session.session-lens").search_session, {
			noremap = true,
			desc = "Search Sessions",
		})
	end,
}
