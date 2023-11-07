require 'lspconfig'.pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    maxLineLength = 120
                },
                flake8 = {
                    enabled = true,
                    maxLineLength = 120,
                    ignore = { 'D102', 'D101' },
                },
                pydocstyle = {
                    enabled = true
                },
                rope_completion = {
                    enabled = true
                },
                rope_autoimport = {
                    enabled = true
                },
                ruff = {
                    enabled = true
                },
            }
        }
    }
}
