local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
end

return {
    {
        "folke/tokyonight.nvim",
        config = function()

            vim.cmd.colorscheme("tokyonight")

            -- Brighter comments
            vim.api.nvim_set_hl(0, "Comment", {
                fg = "#90dabd",
                italic = true,
            })

            -- Brighter netrw banner/header text
            vim.api.nvim_set_hl(0, "Directory", {
                fg = "#aaff9e",
                bold = true,
            })

            -- Line numbers
            vim.api.nvim_set_hl(0, "LineNr", {
                fg = "#c7c7c7", -- regular line numbers
            })

            vim.api.nvim_set_hl(0, "CursorLineNr", {
                fg = "#ffe900", -- current line number
                bold = true,
            })

            enable_transparency()
        end
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        opts = {
            theme = "tokyonight",
        }
    }
}
