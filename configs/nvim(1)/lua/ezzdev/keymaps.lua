-- Set the leader key to <Space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- Disable <Space> to avoid unintended actions
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Disable 'q' (recording macro) and re-enable if needed
-- keymap.set("n", "q", "")

-- Ensure consistency with LazyVim mappings

-- Improved window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- Resize splits with Ctrl+Arrow keys
keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Better handling of pasted text
keymap.set("x", "p", '"_dP', { desc = "Paste without overwriting register" })

-- Maintain Yank/Change/Delete without affecting registers
keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yank" })
keymap.set({ "n", "v" }, "<leader>c", '"_c', { desc = "Change without yank" })

-- Clear search highlighting, messages, and floating windows
keymap.set({ "n", "i" }, "<Esc>", function()
  vim.cmd("nohlsearch")
  vim.cmd("stopinsert")
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative ~= "" then
      vim.api.nvim_win_close(win, false)
    end
  end
end, { desc = "Clear highlights, messages, and floating windows" })

-- Better scrolling (center cursor)
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Smart start/end of line navigation
keymap.set("n", "H", "^", { desc = "Go to start of line" })
keymap.set("n", "L", "g_", { desc = "Go to end of line" })

-- Increment/decrement numbers
keymap.set("n", "+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "-", "<C-x>", { desc = "Decrement number" })

-- Moving lines in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line(s) down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line(s) up" })

-- Smart insert on blank line (auto-indent)
keymap.set("n", "i", function()
  if #vim.fn.getline(".") == 0 then
    return [["_cc]]
  else
    return "i"
  end
end, { expr = true })

-- Add undo break-points
keymap.set("i", ",", ",<C-g>u")
keymap.set("i", ".", ".<C-g>u")
keymap.set("i", ";", ";<C-g>u")

-- Search and replace current word (case-sensitive)
keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Replace current word (case sensitive)" })
keymap.set("v", "<leader>s", ":s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Replace current word (case sensitive)" })

-- Mapping for dd that doesn't yank empty lines into your default register
keymap.set("n", "dd", function()
  if vim.api.nvim_get_current_line():match("^%s*$") then
    return '"_dd'
  else
    return "dd"
  end
end, { expr = true, desc = "Delete line but don't yank empty lines" })

-- Better indenting in visual mode
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Custom command shortcuts
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("WQ", "wq", {})
vim.api.nvim_create_user_command("Qa", "qa", {})

-- Inspect highlights under the cursor
keymap.set("n", "<M-k>", "<cmd>Inspect<cr>", { desc = "Highlight captures under cursor" })

