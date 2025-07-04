return {
	{
		-- Note to self. If blink is not working after an update. Try removing blink files from ~/.local/share/nvim
		"saghen/blink.cmp",
		version = "1.*",
		event = { "InsertEnter", "CmdlineEnter" },

		dependencies = {
			{
				"ray-x/lsp_signature.nvim",
				event = "InsertEnter",
				opts = {
					bind = true,
					handler_opts = {
						border = "rounded",
					},
				},
				config = function(_, opts)
					require("lsp_signature").setup(opts)
				end,
			},

			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				config = function()
					require("luasnip").setup({
						require("luasnip").filetype_extend("cpp", { "cppdoc" }),
					})

					local luasnip = require("luasnip")

					vim.keymap.set({ "i", "s" }, "<C-N>", function()
						luasnip.jump(1)
					end, { silent = true })
					vim.keymap.set({ "i", "s" }, "<C-E>", function()
						luasnip.jump(-1)
					end, { silent = true })
				end,

				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},

				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
			},
		},

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			snippets = { preset = "luasnip" },

			sources = {
				default = { "snippets", "lsp", "path", "buffer", "cmdline" },
			},

			vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "NONE", fg = "#808080" }),
			vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = "NONE", fg = "#89b4fa" }),
			vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { bg = "NONE", fg = "#569CD6" }),
			vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "#1e1e2e" }),
			vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { bg = "NONE", fg = "#89b4fa" }),
			vim.api.nvim_set_hl(0, "BlinkCmpDocSeparator", { bg = "#1e1e2e", fg = "#f9e2af" }),
			vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelp", { bg = "#1e1e2e" }),
			vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { bg = "NONE", fg = "#89b4fa" }),

			keymap = {
				preset = "default",

				["<Tab>"] = {},
				["<Shift-Tab>"] = {},
				["<C-e>"] = { "select_prev", "fallback" },
			},

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},

			completion = {
				list = {
					selection = { preselect = true, auto_insert = false },
				},
				menu = {
					border = "rounded",
					draw = {
						columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
						components = {
							kind_icon = {
								width = { fill = true },
								text = function(ctx)
									local kind_icons = {
										Text = " ",
										Method = " ",
										Function = " ",
										Constructor = " ",
										Field = " ",
										Variable = " ",
										Class = " ",
										Interface = " ",
										Module = " ",
										Property = " ",
										Unit = " ",
										Value = " ",
										Enum = " ",
										Keyword = " ",
										Snippet = " ",
										Color = " ",
										File = " ",
										Reference = " ",
										Folder = " ",
										EnumMember = " ",
										Constant = " ",
										Struct = " ",
										Event = " ",
										Operator = " ",
										TypeParameter = " ",
									}
									-- return kind_icons[ctx.kind] .. ctx.icon_gap
								end,
							},
						},
					},
				},
				documentation = {
					window = {
						border = "rounded",
					},
					auto_show = true,
					auto_show_delay_ms = 500,
				},
			},
			signature = {
				enabled = false, -- Another plugin does that included in this plugin's dependency.
				window = {
					border = "rounded",
				},
			},

			vim.keymap.set("n", "<C-n>", "<C-w>j", { desc = "switch window down" }),
		},
		opts_extend = { "sources.default" },
	},
}
