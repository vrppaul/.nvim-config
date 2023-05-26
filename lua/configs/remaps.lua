vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "<leader>oo", function()
     vim.cmd('normal!  "+y')
     vim.fn.system('xclip -selection clipboard', vim.fn.getreg('+'))
 end, {noremap = true, silent = true})

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
