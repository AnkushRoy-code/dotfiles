require("full-border"):setup({
    -- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
    type = ui.Border.ROUNDED,
})

require("git"):setup()

THEME.git = THEME.git or {}
THEME.git.modified_sign = "M"
THEME.git.added_sign = "✚"
THEME.git.untracked_sign = ""
THEME.git.ignored_sign = ""
THEME.git.deleted_sign = "✖"
THEME.git.updated_sign = "󰁕"
