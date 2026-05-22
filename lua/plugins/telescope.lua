return {
    'nvim-telescope/telescope.nvim',
    version = '*',

    dependencies = {
        'nvim-lua/plenary.nvim',

        -- optional but recommended
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make'
        },
    },

    config = function()
        local builtin = require('telescope.builtin')

        -- Find files relative to current buffer's directory
        vim.keymap.set('n', '<leader>ff', function()
            builtin.find_files({
                cwd = vim.fn.expand('%:p:h'),
            })
        end, { desc = 'Find files in current buffer directory' })

        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {
            desc = 'Telescope live grep'
        })

        vim.keymap.set('n', '<leader>fb', builtin.buffers, {
            desc = 'Telescope buffers'
        })

        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {
            desc = 'Telescope help tags'
        })
    end
}
