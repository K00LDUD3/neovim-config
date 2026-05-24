return {
    {
        'saghen/blink.cmp',
        version = 'v1.9.*',

        opts = {
            keymap = {
                preset = 'default',

                ['<Tab>'] = { 'accept', 'fallback' },
                ['<CR>'] = { 'accept', 'fallback' },

                ['<C-j>'] = { 'select_next', 'fallback' },
                ['<C-k>'] = { 'select_prev', 'fallback' },

                ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            },

            appearance = {
                nerd_font_variant = 'mono',
            },

            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,

                    window = {
                        border = 'rounded',
                    },
                },

                menu = {
                    border = 'rounded',

                    draw = {
                        treesitter = { 'lsp' },
                    },
                },

                list = {
                    selection = {
                        preselect = true,
                        auto_insert = false,
                    },
                },

                trigger = {
                    show_on_trigger_character = true,
                    show_on_keyword = true,
                },

                ghost_text = {
                    enabled = true,
                },
            },

            fuzzy = {
                implementation = 'prefer_rust_with_warning',

                sorts = {
                    'exact',
                    function (a,b)
                        local a_len = #a.label
                        local b_len = #b.label
                        if a_len ~= b_len then
                            return a_len < b_len
                        end
                    end,
                    'score',
                    'sort_text',
                },
            },

            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            signature = {
                enabled = true,

                window = {
                    border = 'rounded',
                },
            },
        },
    },
}
