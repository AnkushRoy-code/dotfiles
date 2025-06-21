return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
    {
        "hat0uma/csvview.nvim",
        ---@module "csvview"
        ---@type CsvView.Options
        opts = {
            parser = { comments = { "#", "//" } },
            keymaps = {
                -- Text objects for selecting fields
                textobject_field_inner = { "if", mode = { "o", "x" } },
                textobject_field_outer = { "af", mode = { "o", "x" } },
                -- Excel-like navigation:
                -- Use <Tab> and <S-Tab> to move horizontally between fields.
                -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
                -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
                jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
                jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
                jump_next_row = { "<Enter>", mode = { "n", "v" } },
                jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
            },
        },
        cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
    },
    {
        "Fildo7525/pretty_hover",
        event = "LspAttach",
        version = "*",
        config = function()
            require("pretty_hover").setup({})
            local map = vim.keymap.set
            map("n", "H", function()
                require("pretty_hover").hover()
            end, { desc = "Hover docs" })
        end,
    },

    { -- Adds git related signs to the gutter, as well as utilities for managing changes
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
    },

    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        opts = {
            transparent_background = true,
        },
        config = function()
            vim.cmd.colorscheme("catppuccin-mocha")
        end,
    },

    {
        "brenoprata10/nvim-highlight-colors",
        event = { "BufReadPost", "BufNewFile" },

        config = function()
            -- Ensure termguicolors is enabled if not already
            vim.o.termguicolors = true

            require("nvim-highlight-colors").setup({
                render = "background",
                enable_named_colors = true,
                enable_tailwind = false,
            })
        end,
    },

    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle UndoTree" },
        },
    },

    {
        -- Getting removed pretty fast
        "hedyhli/outline.nvim",
        cmd = { "Outline", "OutlineOpen" },
        keys = { -- Example mapping to toggle outline
            { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
        },
        opts = {
            -- Your setup opts here
        },
    },

    { -- Useful plugin to show you pending keybinds.
        "folke/which-key.nvim",
        enabled = true,
        keys = { "<leader>" },
        event = { "InsertEnter" },

        config = function() -- This is the function that runs, AFTER loading
            require("which-key").setup()

            -- Document existing key chains
            require("which-key").add({
                { "<leader>c", group = "[C]ode" },
                { "<leader>d", group = "[D]ocument" },
                { "<leader>r", group = "[R]ename" },
                { "<leader>s", group = "[S]earch" },
                { "<leader>w", group = "[W]orkspace" },
                { "<leader>t", group = "[T]oggle" },
            })
        end,
    },
}
