vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.wrap = true

vim.o.list = false
vim.o.linebreak = true

vim.o.laststatus = 3

vim.g.termguicolor = true

vim.o.mouse = "a"

vim.o.showmode = false

vim.schedule(function()
    vim.o.clipboard = "unnamedplus"
end)

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = "yes"

vim.o.updatetime = 250

vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.o.inccommand = "split"

vim.o.cursorline = true

vim.o.scrolloff = 10

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.cmd([[highlight WinSeparator guifg=#65ADDC]])

vim.o.pumheight = 15 -- The number of items in the completion window/all popups

vim.filetype.add({
    extension = {
        hlsl = "hlsl",
        glsl = "glsl",
        vert = "glsl",
        tese = "glsl",
        frag = "glsl",
        geom = "glsl",
        comp = "glsl",
        vs = "glsl",
        fs = "glsl",
    },
})
