vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
--vim.keymap.set("n", "<BS>", "db")
--vim.keymap.set("n", "<BS>", function()
--    require('spider').motion('b')
--    vim.cmd('normal! dw')
--end)

--NOTE: backspace deletes until previous word boundary
--TODO: need to queue a del right after below sequence
vim.keymap.set("n", "<BS>", function()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local row, col = cursor[1], cursor[2]
    require('spider').motion('b')
    local new_cursor = vim.api.nvim_win_get_cursor(0)
    local new_row, new_col = new_cursor[1], new_cursor[2]
    if row == new_row then
        local line = vim.api.nvim_get_current_line()
        local new_line = line:sub(1, new_col) .. line:sub(col + 1)
        vim.api.nvim_set_current_line(new_line)
        vim.api.nvim_win_set_cursor(0, { row, new_col })
    end
end)

vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.keymap.set("n", "T", function()
      local node = vim.fn["netrw#Call"]("NetrwFile", vim.fn.line("."))

      if node == nil or node == "" then
        print("No directory found")
        return
      end

      vim.cmd("tabnew")
      vim.cmd("Explore " .. vim.fn.fnameescape(node))
    end, { buffer = true, desc = "Open netrw dir in new tab" })
  end,
})

-- Normal Lettering
-- CamelCaseLettering
-- under_score_casing

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

