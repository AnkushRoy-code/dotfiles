vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- vim.keymap.set("n", "<up>", "<C-a>", { desc = "Increment" })
-- vim.keymap.set("n", "<down>", "<C-x>", { desc = "Decrement" })

-- vim.keymap.set("n", "<leader>gf", "msgg=G's", {desc = "Format the whole file"})

vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "next buffer" })

vim.keymap.set("n", "<M-n>", "<cmd>cnext<CR>", { desc = "next QuiCk Fix List" })
vim.keymap.set("n", "<M-e>", "<cmd>cprev<CR>", { desc = "prev QuiCk Fix List" })

vim.keymap.set("n", "<leader>nt", "<cmd>NvimTreeToggle<cr>", { desc = "Toggles NvimTree" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("TermOpen", {
	desc = "Remove all linenumbers from Term",
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.o.number = false
		vim.o.relativenumber = false
	end,
})

vim.keymap.set("n", "<leader>st", function()
	vim.cmd.new()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 10)
end, { desc = "Open terminal horizontal" })

vim.keymap.set("n", "<leader>vt", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("L")
	vim.api.nvim_win_set_width(0, 35)
end, { desc = "Open terminal vertical" })

-- move the cursor to specific widnow
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- maps for colemak  users
vim.keymap.set("n", "<leader>m", "<C-w>h", { desc = "switch window left" })
vim.keymap.set("n", "<C-n>", "<C-w>j", { desc = "switch window down" })
vim.keymap.set("n", "<C-e>", "<C-w>k", { desc = "switch window up" })
vim.keymap.set("n", "<C-i>", "<C-w>l", { desc = "switch window right" })

-- resize the panes of window
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- vim.keymap.set("i", "<C-S>", "<Esc>:w<CR>i", { desc = "Increase Window Width" }) -- I ain't no backstabber. I made it to teach my sister Python....sorry I chose the wrong language.

-- vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
-- vim.keymap.set("n", "<C-u>", "<C-u>zz", {})

vim.api.nvim_create_user_command("DiagnosticsToggleVirtualText", function()
	local current_value = vim.diagnostic.config().virtual_text
	if current_value then
		vim.diagnostic.config({ virtual_text = false })
	else
		vim.diagnostic.config({ virtual_text = true })
	end
end, {})

vim.api.nvim_create_user_command("DiagnosticsToggle", function()
	local current_value = vim.diagnostic.is_enabled()
	if current_value then
		vim.diagnostic.enable(false)
	else
		vim.diagnostic.enable()
	end
end, {})

vim.api.nvim_set_keymap(
	"n",
	"<Leader>ii",
	':lua vim.cmd("DiagnosticsToggleVirtualText")<CR>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<Leader>id", ':lua vim.cmd("DiagnosticsToggle")<CR>', { noremap = true, silent = true })
