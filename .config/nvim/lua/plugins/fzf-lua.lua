return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "FzfLua" },

    keys = function()
        local function cmd(s)
            return "<cmd>FzfLua " .. s .. "<cr>"
        end

        return {
            { "<leader>sM",       cmd("manpages"),              desc = "[S]earch [M]an pages" },
            { "<leader>sR",       cmd("registers"),             desc = "[S]earch [R]egisters" },
            { "<leader>sd",       cmd("diagnostics_document"),  desc = "[S]earch [d]iagnostics" },
            { "<leader>sf",       cmd("files"),                 desc = "[S]earch [F]iles" },
            { "<leader>sg",       cmd("live_grep"),             desc = "[S]earch [G]rep" },
            { "<leader>sh",       cmd("helptags"),              desc = "[S]earch [H]elp" },
            { "<leader>sk",       cmd("keymaps"),               desc = "[S]earch [K]eymaps" },
            { "<leader>sr",       cmd("resume"),                desc = "[S]earch [R]esume" },
            { "<leader>sm",       cmd("marks"),                 desc = "[S]earch [M]arks" },
            { "<leader>ss",       cmd("builtin"),               desc = "[S]earch [S]elect FzfLua" },
            { "<leader>s.",       cmd("oldfiles"),              desc = "[S]earch [.]Recent Files" },
            { "<leader>gC",       cmd("git_commits"),           desc = "[G]it [C]ommits search" },
            { "<leader>gb",       cmd("git_branches"),          desc = "[G]it [B]ranches search" },
            { "<leader>go",       cmd("git_status"),            desc = "[G]it [S]tatus search" },
            { "<leader>gD",       cmd("git_diff"),              desc = "[G]oto [D]iff" },
            { "<leader>gd",       cmd("lsp_definitions"),       desc = "[G]oto [d]efinition" },
            { "<leader>gr",       cmd("lsp_references"),        desc = "[G]oto [R]eferences" },
            { "<leader>gI",       cmd("lsp_implementations"),   desc = "[G]oto [I]mplementation" },
            { "<leader>D",        cmd("lsp_typedefs"),          desc = "Type [D]efinition" },
            { "<leader>ds",       cmd("lsp_document_symbols"),  desc = "[D]ocument [S]ymbols" },
            { "<leader>ws",       cmd("lsp_workspace_symbols"), desc = "[W]orkspace [S]ymbols" },
            { "<leader>/",        cmd("lgrep_curbuf"),          desc = "[/] Fuzzily search in current buffer" },
            { "<leader><leader>", cmd("buffers"),               desc = "[ ] Find existing buffers" },
        }
    end,

    opts = {
        file_icon_padding = " ",
        keymap = {
            fzf = {
                ["ctrl-a"] = "toggle-all",
            },
        },
        grep = {
            follow = true,
        },
    },
}

-- vim.keymap.set("n", "<leader>sn", function()
-- 	builtin.find_files({ cwd = vim.fn.stdpath("config") })
-- end, { desc = "[S]earch [N]eovim files" })

-- file_ignore_patterns = {
-- 	"build/.*", -- Ignore the dirs
-- 	".cache/.*",
-- 	"debug/.*",
-- 	"vendor/.*",
-- 	"subprojects/.*",
-- 	"thirdparty/.*",
-- 	"Subprojects/.*",
-- 	".git/.*",
-- 	"libraries/.*",
-- 	"lib/.*",
-- 	"libs/.*",
-- },
