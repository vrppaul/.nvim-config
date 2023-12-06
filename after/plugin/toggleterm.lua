require("toggleterm").setup {
    open_mapping = [[<C-t>]],
    direction = 'vertical',
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end
}

local function run_in_toggleterm(args)
    local command  = args.args

    local on_open  = function(term)
        -- simulate the following key press sequence: <C-\><C-n><C-w>p
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n><C-w>p", true, true, true), "n", true)
    end

    local Terminal = require('toggleterm.terminal').Terminal
    local shell    = Terminal:new({ cmd = command, hidden = true, on_open = on_open })

    shell:toggle()
end

vim.api.nvim_create_user_command(
    'TT',
    run_in_toggleterm,
    { nargs = "*", desc = "Run command in a new ToggleTerm terminal" }
)

vim.keymap.set("n", "<leader>tt", ":TT ");
