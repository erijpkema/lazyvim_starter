-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set(
  "n",
  "<F5>",
  'i<C-r>=strftime("## %a %d %b %Y %H:%M:%S %Z")<CR><Esc> /F5',
  { noremap = true, silent = true, desc = "Insert timestamp with F5" }
)

vim.keymap.set("c", "w!!", "w !sudo tee % >/dev/null", { noremap = true, silent = true, desc = "Save as sudo" })

vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "Git blame" })
