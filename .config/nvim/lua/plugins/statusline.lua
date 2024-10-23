return {
    -- The bar at the bottom
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = { "BufReadPost", "BufNewFile" },

    config = function()
        require("lualine").setup({
            options = {
                globalstatus = true, -- enable global statusline (have a single statusline
            },
            sections = {
                lualine_x = { "filetype" },
            },
        })
    end,
}
