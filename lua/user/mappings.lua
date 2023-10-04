vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = ","

-- vim.keymap.set("n", "<Leader>e", "<cmd>:Neotree toggle<CR>", { desc = "Explore"})
-- vim.keymap.set("n", "<Leader>o", function()
--         if vim.bo.filetype == "neo-tree" then
--         vim.cmd.wincmd "p"
--       else
--         vim.cmd.Neotree "focus"
--       end
--     end, { desc = "Explorer focus" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<Leader><Tab>", "<C-w>p", { desc = "Last Buffer" })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste void" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank Clipboard" })
--vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank Clipboard"})
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete void" })

-- This is going to get me cancelled
--vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<Leader>=", vim.lsp.buf.format, { desc = "Format" })

vim.keymap.set("n", "<Leader>jk", "<cmd>cnext<CR>zz", { desc = "Next error" })
vim.keymap.set("n", "<Leader>jj", "<cmd>cprev<CR>zz", { desc = "Prev error" })
vim.keymap.set("n", "<Leader>jK", "<cmd>lnext<CR>zz", { desc = "Next buf err" })
vim.keymap.set("n", "<Leader>jJ", "<cmd>lprev<CR>zz", { desc = "Prev buf err" })

vim.keymap.set("n", "<Leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "substitute" })
vim.keymap.set("n", "<Leader>fx", "<cmd>!chmod +x %<CR>", { desc = "Chmod", silent = true })
vim.keymap.set("n", "<Leader>q", "<cmd>qa<CR>", { desc = "Quit" })
--vim.keymap.set("n", "<leader><leader>", function()
--    vim.cmd("so")
--end)
