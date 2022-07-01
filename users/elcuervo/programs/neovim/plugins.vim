autocmd BufWritePre *.tf,*.hcl lua vim.lsp.buf.formatting_sync()
