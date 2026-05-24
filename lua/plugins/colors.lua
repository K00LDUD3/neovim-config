local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "folke/tokyonight.nvim",

        config = function()
            require("tokyonight").setup({
                transparent = true,
            })

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

            -- Line numbers + gutter
            vim.api.nvim_set_hl(0, "LineNr", {
                fg = "#7a7a7a",
                bg = "#111111",
            })

            vim.api.nvim_set_hl(0, "CursorLineNr", {
                fg = "#ff843e",
                bg = "#1a1a1a",
                bold = true,
            })

            vim.api.nvim_set_hl(0, "SignColumn", {
                bg = "#111111",
            })

            vim.api.nvim_set_hl(0, "FoldColumn", {
                bg = "#111111",
            })

            -- Current line highlight
            vim.opt.cursorline = true

            vim.api.nvim_set_hl(0, "CursorLine", {
                bg = "#161616",
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
