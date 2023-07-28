vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "<leader>oo", function()
    vim.cmd('normal!  "+y')
    vim.fn.system('xclip -selection clipboard', vim.fn.getreg('+'))
end, { noremap = true, silent = true })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<A-k>", "<Cmd>m .-2<CR>")
vim.keymap.set("n", "<A-j>", "<Cmd>m .+1<CR>")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
