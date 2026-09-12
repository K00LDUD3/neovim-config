vim.opt.number = true
vim.opt.cursorline = true

vim.g.netrw_liststyle = 3
vim.g.netrw_keepdir = 0

vim.opt.backspace = { "indent", "eol", "start" }

-- Normal line numbers

--vim.opt.relativenumber = true


-- some comment asdf asd fasd fas fd

vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true


vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = true,
    underline = true,
})

--vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--    vim.lsp.diagnostic.on_publish_diagnostics,
--    {
--        severity_sort = true,
--    }
--)

vim.diagnostic.config({
    severity_sort = true,
})

vim.g.lua_diagnostics_disable = {
    "line-too-long",
}


--NOTE: For python parameter color highlight overrides
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python" },
    callback = function(args)
        vim.treesitter.start(args.buf, "python")
    end,
})
