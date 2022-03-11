autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()
