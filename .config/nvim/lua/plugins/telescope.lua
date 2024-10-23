-- For horizontal and vertical telescope ui relative to screen width/height
function v_Or_h()
	if vim.o.columns >= 100 then
		return "horizontal"
	else
		return "vertical"
	end
end

return {
	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		enabled = true,
		cmd = { "Telescope" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},

		keys = function()
			local cmdT = "<cmd>Telescope "

			return {
				{ "<leader>sM", cmdT .. "man_pages<cr>", desc = "Telescope man pages" },
				{ "<leader>sR", cmdT .. "registers<cr>", desc = "Telescope registers" },

				{ "<leader><leader>", cmdT .. "buffers<cr>", desc = "[ ] Find existing buffers" },
				{
					"<leader>ss",
					cmdT .. "builtin<cr>",
					desc = "[S]earch [S]elect Telescope",
				},
				{ "<leader>sd", cmdT .. "diagnostics<cr>", desc = "[S]earch [D]iagnostics" },
				{ "<leader>sf", cmdT .. "find_files<cr>", desc = "[S]earch [F]iles" },
				{ "<leader>sg", cmdT .. "live_grep<cr>", desc = "[S]earch by [G]rep" },
				{ "<leader>sh", cmdT .. "help_tags<cr>", desc = "[S]earch [H]elp" },

				{ "<leader>sk", cmdT .. "keymaps<cr>", desc = "[S]earch [K]eymaps" },
				{ "<leader>sr", cmdT .. "resume<cr>", desc = "[S]earch [R]esume" },
				{ "<leader>sm", cmdT .. "marks<cr>", desc = "[S]earch [M]arks" },
				{
					"<leader>s.",
					cmdT .. "oldfiles<cr>",
					desc = '[S]earch Recent Files ("." for repeat)',
				},
				{ "<leader>sw", cmdT .. "grep_string<cr>", desc = "[S]earch current [W]ord" },

				{ "<leader>gC", cmdT .. "git_commits<cr>", desc = "Telescope git commits" },
				{ "<leader>gb", cmdT .. "git_branches<cr>", desc = "Telescope git branches" },
				{ "<leader>go", cmdT .. "git_status<cr>", desc = "Telescope git status" },
			}
		end,

		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						hidden = true,
						follow = true,
					},
				},
				defaults = {
					vimgrep_arguments = {
						"rg", -- Use ripgrep (rg) for grepping
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"-L",
					},
					layout_strategy = v_Or_h(),

					layout_config = {
						vertical = {
							preview_cutoff = 10,
						},
						horizontal = {
							preview_width = 0.5,
							preview_cutoff = 10,
						},
					},
					file_ignore_patterns = {
						"build/.*", -- Ignore the dirs
						".cache/.*",
						"vendor/.*",
						"subprojects/.*",
						"thirdparty/.*",
						"Subprojects/.*",
						".git/.*",
						"libraries/.*",
						"lib/.*",
						"libs/.*",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })

			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })
		end,
	},
}
