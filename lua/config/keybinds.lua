vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
--vim.keymap.set("n", "<BS>", "db")
vim.keymap.set("n", "<BS>", function()
    require('spider').motion('b')
    vim.cmd('normal! dw')
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
