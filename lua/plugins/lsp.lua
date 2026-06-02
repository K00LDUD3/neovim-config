return {
    {
        "williamboman/mason.nvim",

        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        },

        config = function()
            require("mason").setup()

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "pyright",
                    "ruff",
                }
            })

            vim.diagnostic.config({
                virtual_lines = false,
                underline = true,
            })

            local capabilities =
                require('blink.cmp').get_lsp_capabilities()

            -- Disable pylsp formatting nags
            vim.lsp.config('pylsp', {
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                ignore = {
                                    'E501',
                                    'E302',
                                    'W391',
                                    'E303',
                                    'E265',
                                    'E262',
                                    'E226',
                                },
                            },
                        },
                    },
                },
            })

            -- Lua
            vim.lsp.config('lua_ls', {
                capabilities = capabilities,

                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' },

                            disable = {
                                'line-too-long',
                            },
                        },
                    },
                },
            })

            -- C/C++
            vim.lsp.config('clangd', {
                capabilities = capabilities,

                cmd = {
                    "clangd",
                    "--background-index",
                    "--completion-style=detailed",
                    "--all-scopes-completion",
                    "--header-insertion=never",
                },
            })

            -- Python type checker
            vim.lsp.config('pyright', {
                capabilities = capabilities,
            })

            -- Ruff
            vim.lsp.config('ruff', {
                capabilities = capabilities,

                settings = {
                    lint = {
                        ignore = {
                            "E501",
                            "W391",
                        },
                    },
                },
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup(
                    "UserLspConfig",
                    {}
                ),

                callback = function(ev)
                    local opts = { buffer = ev.buf }

                    vim.keymap.set(
                        "n",
                        "gd",
                        vim.lsp.buf.definition,
                        opts
                    )

                    vim.keymap.set(
                        "n",
                        "<leader><space>",
                        vim.lsp.buf.hover,
                        opts
                    )

                    vim.keymap.set(
                        "n",
                        "gi",
                        vim.lsp.buf.implementation,
                        opts
                    )

                    vim.keymap.set(
                        "n",
                        "<leader>D",
                        vim.lsp.buf.type_definition,
                        opts
                    )

                    vim.keymap.set(
                        "n",
                        "<leader>rn",
                        vim.lsp.buf.rename,
                        opts
                    )

                    vim.keymap.set(
                        { "n", "v" },
                        "<leader>ca",
                        vim.lsp.buf.code_action,
                        opts
                    )

                    vim.keymap.set(
                        "n",
                        "gr",
                        vim.lsp.buf.references,
                        opts
                    )

                    vim.keymap.set(
                        "n",
                        "<leader>f",
                        function()
                            vim.lsp.buf.format({
                                async = true
                            })
                        end,
                        opts
                    )

                    vim.keymap.set(
                        "n",
                        "<leader>d",
                        function()
                            vim.diagnostic.open_float({
                                border = "rounded"
                            })
                        end,
                        opts
                    )
                end,
            })

            vim.lsp.enable('lua_ls')
            vim.lsp.enable('clangd')
            vim.lsp.enable('pyright')
            vim.lsp.enable('ruff')
            vim.lsp.enable('pylsp')
        end
    },
}
