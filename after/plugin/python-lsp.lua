require 'lspconfig'.pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    maxLineLength = 120
                },
                flake8 = {
                    enabled = true
                },
                pydocstyle = {
                    enabled = true
                }

            }
        }
    }
}

