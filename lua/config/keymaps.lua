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

vim.keymap.set("n", "<F9>", function()
  local file = vim.fn.expand("%:p") -- get full path of current file
  vim.cmd("!python3 " .. vim.fn.shellescape(file))
end, { buffer = true })

local function insert_debug_trace()
  local ft = vim.bo.filetype
  local line = ""

  if ft == "python" then
    line = [[import ipdb; ipdb.set_trace]]
  elseif ft == "javascript" then
    line = "debugger;"
  else
    vim.notify("No debug trace defined for filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  -- Insert line above current line
  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, { line })

  -- Save the buffer
  vim.cmd("write")
end

vim.keymap.set("n", "<F6>", insert_debug_trace, { buffer = true, desc = "Insert debug trace" })
