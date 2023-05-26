 require'lspconfig'.ruff_lsp.setup{
   init_options = {
     settings = {
       -- Any extra CLI arguments for `ruff` go here.
       args = {"line-length = 100"},
     }
   }
 }

 require'lspconfig'.pylsp.setup{
     settings = {
         pylsp = {
             plugins = {
                 pycodestyle = {
                     maxLineLength = 120
                 }
             }
         }
     }
 }

