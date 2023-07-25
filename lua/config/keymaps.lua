-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "Y", "y$", { desc = "Copy to end" })

map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- keeping it centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

-- escape
map("i", "<c-c>", "<Esc>")

-- additional breakpoints
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")
map("i", "!", "!<c-g>u")
map("i", "?", "?<c-g>u")
map("i", "=", "=<c-g>u")

-- reselect original text when pasting in visual mode
map("x", "p", "pgvy")

-- insert uuid
map("i", "<c-i>", "<c-r>=system('uuid')<cr>")
--
-- harpoon
map("n", "<leader>jj", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")
map("n", "<leader>ja", "<cmd>lua require('harpoon.mark').add_file()<CR>")
map("n", "<leader>jp", "<cmd>lua require('harpoon.ui').nav_prev()<CR>")
map("n", "<leader>jn", "<cmd>lua require('harpoon.ui').nav_next()<CR>")
map("n", "<leader>j1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>")
map("n", "<leader>j2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>")
map("n", "<leader>j3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>")
map("n", "<leader>j4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>")
