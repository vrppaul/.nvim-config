local M = {}
M.layout_snapshot = nil

-- Default configuration
local config = {
    restore_on_winleave = false,
}

-- Check if the plugin is already loaded
if vim.g.loaded_vim_maximizer then
    return
end
vim.g.loaded_vim_maximizer = 1

local function save_layout()
    local current_win = vim.api.nvim_get_current_win()
    local wins = vim.api.nvim_list_wins()
    local layout = {}

    for _, win in ipairs(wins) do
        vim.api.nvim_set_current_win(win)
        layout[win] = {
            width = vim.api.nvim_win_get_width(win),
            height = vim.api.nvim_win_get_height(win)
        }
    end

    vim.api.nvim_set_current_win(current_win)
    return layout
end

-- Function to restore the layout from a saved snapshot
local function restore_layout(snapshot)
    for win, size in pairs(snapshot) do
        if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_set_width(win, size.width)
            vim.api.nvim_win_set_height(win, size.height)
        end
    end
end

-- Function to maximize the current window
local function maximize()
    M.layout_snapshot = save_layout()
    local win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_width(win, vim.api.nvim_get_option("columns"))
    vim.api.nvim_win_set_height(win, vim.api.nvim_get_option("lines"))
end

-- Function to restore the window and layout
local function restore()
    if M.layout_snapshot then
        restore_layout(M.layout_snapshot)
        M.layout_snapshot = nil
    end
end

-- Function to toggle between maximize and restore
function M.toggle()
    if M.layout_snapshot then
        restore()
    else
        maximize()
    end
end

-- Window leave behavior
if config.restore_on_winleave then
    vim.api.nvim_command([[
        augroup maximizer
        autocmd!
        autocmd WinLeave * lua require("maximizer").restore()
        augroup END
    ]])
end

vim.api.nvim_create_user_command('MaximizeWindow', maximize, {})
vim.api.nvim_create_user_command('RestoreWindow', restore, {})
vim.api.nvim_create_user_command('ToggleMaximizeWindow', M.toggle, {})

-- Setting up key mappings
vim.api.nvim_set_keymap('n', '<F3>', ':ToggleMaximizeWindow<CR>',
    { noremap = true, silent = true })
