return {
    {
        'saghen/blink.cmp',
        version = 'v1.9.*',
        opts = {
            keymap = {
		preset = 'default',
		['<Tab>'] = { 'accept', 'fallback' },
		['<C-j>'] = { 'select_next', 'fallback' },
		['<C-k>'] = { 'select_prev', 'fallback' },
	    },
	    appearance = {
                nerd_font_variant = 'mono',
            },
            completion = {
                documentation = { auto_show = true },
                trigger = {
                    show_on_trigger_character = true,
                },
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
            trigger = {
                completion = {
                    show_on_trigger_character = true,
                },
            },
        },
    },
}
