return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        event = { "BufReadPost", "BufNewFile" },
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                view = {
                    side = "right",
                },
            })
        end,
    },

    {
        -- File Explorer
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = { "BufReadPost", "BufNewFile" },
        cmd = "Oil",
        keys = { { "<leader>fe", "<cmd>Oil<cr>", desc = "Open File explorer(OIL)" } },
        enabled = true,

        config = function(_, opts)
            require("oil").setup(opts)
        end,
    },
}
