vim.cmd [[autocmd BufWritePre * undojoin | lua vim.lsp.buf.formatting_seq_sync()]]
