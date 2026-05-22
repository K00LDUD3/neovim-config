return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
--    event = "BufReadPost",
    config = function()
        vim.treesitter.language.register('lua', 'lua')
        require('nvim-treesitter').setup({
            ensure_installed = {
                "lua",
                "bash",
                "c",
                "cmake",
                "cpp",
                "diff",
                "dockerfile",
                "gitignore",
                "html",
                "java",
                "json",
                "markdown",
                "markdown_inline",
                "python",
                "regex",
                "xml",
		"python",
            },
            auto_install = false,
        })
    end,
}
