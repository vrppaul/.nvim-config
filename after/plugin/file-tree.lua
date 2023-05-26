-- disable netrw at the very start of your init.lua (strongly advised)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
-- require("nvim-tree").setup()

vim.keymap.set("n", "<leader>ft", vim.cmd.NeoTreeRevealToggle)

require("neo-tree").setup({
    filesystem = {
        hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
    },
})
