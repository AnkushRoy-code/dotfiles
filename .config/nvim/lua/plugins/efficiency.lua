return { -- This file contains plugins that help me navigate/edit files faster.
    {
        "otavioschwanck/arrow.nvim",
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
            -- or if using `mini.icons`
            -- { "echasnovski/mini.icons" },
        },
        opts = {
            show_icons = true,
            leader_key = 'l', -- Recommended to be a single key
            buffer_leader_key = 'm', -- Per Buffer Mappings
        }
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
