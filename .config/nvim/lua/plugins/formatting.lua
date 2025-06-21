return {
    -- Formatting
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.cmake_format,

                null_ls.builtins.diagnostics.cmake_lint,
            },
        })
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format Document" })
    end,
}
