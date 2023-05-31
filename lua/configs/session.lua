SESSIONSDIR = "/.config/sessions"
-- Function to save a session
function SaveSession()
    if #vim.v.argv == 0 then -- Don't create a session for an empty instance
        return
    end

    -- Ensure the directory for storing sessions exists
    local sessiondir = vim.fn.expand('$HOME') .. SESSIONSDIR
    if vim.fn.isdirectory(sessiondir) == 0 then
        vim.fn.mkdir(sessiondir, 'p')
    end

    local cwd = vim.fn.getcwd()
    local sessionfile = sessiondir .. "/" .. cwd:gsub('/', '_') .. ".vim"

    -- Save the session
    vim.api.nvim_exec("mksession! " .. sessionfile, false)
end

-- Function to load a session
function LoadSession()
    local sessiondir = vim.fn.expand('$HOME') .. SESSIONSDIR
    local cwd = vim.fn.getcwd()
    local sessionfile = sessiondir .. "/" .. cwd:gsub('/', '_') .. ".vim"

    -- Close NeoTree before saving the session
    vim.api.nvim_exec([[
        if exists("t:neotree")
            silent! NeoTreeClose
        endif
    ]], false)

    -- Load the session if the file exists
    if vim.fn.filereadable(sessionfile) == 1 then
        vim.api.nvim_exec("source " .. sessionfile, false)
    end
end

-- Call LoadSession() when starting Vim
-- vim.api.nvim_exec([[
--     autocmd VimEnter * lua vim.defer_fn(LoadSession, 0)
-- ]], false)

-- Call SaveSession() when quitting Vim
vim.api.nvim_exec([[
    autocmd VimLeave * lua SaveSession()
]], false)
