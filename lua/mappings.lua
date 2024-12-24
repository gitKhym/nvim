require "nvchad.mappings"
-- add yours here

local map = vim.keymap.set
map("n", "<leader>s", "<cmd>update<CR>", { desc = "Save current file" })
map("n", "<leader>qw", "<cmd> q <CR>", { desc = "Quit without saving" })
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })
map("n", "<leader>-", "<cmd> vsplit <CR>", { desc = "Split vertically" })
map("n", "<leader>_", "<cmd> split <CR>", { desc = "Split horizontally" })
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")
map("n", "k", "gk")
map("n", "j", "gj")
map("n", "n", "nzz", { noremap = true, silent = true })
map("n", "N", "Nzz", { noremap = true, silent = true })
map("v", "y", "ygv<esc>")

map({ "n", "v", "x", "o" }, "H", "^")
map({ "n", "v", "x", "o" }, "L", "$")
map("n", "dH", "d^")
map("n", "dL", "d$")

map("n", "E", "ge")

-- VScode alt move line
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })

-- Tmux Navigator
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })

-- Telescope mappings
map("n", "<A-f>", "<cmd> Telescope find_files <CR>", { desc = "Find files" })
map("n", "<leader>gr", function()
  require("telescope.builtin").lsp_references()
end, { desc = "Find Reference" })

-- LSP
map("n", "gh", function()
  vim.lsp.buf.hover()
end, {})

-- Harpoon mappings
map("n", "<A-e>", function()
  require("harpoon.ui").toggle_quick_menu()
end, { desc = "Open Harpoon" })
map("n", "<leader>e", function()
  require("harpoon.mark").add_file()
end, { desc = "Add Harpoon File" })
map("n", "<A-n>", function()
  require("harpoon.ui").nav_prev()
end, {})
map("n", "<A-o>", function()
  require("harpoon.ui").nav_next()
end, {})

-- Trouble mappings
map("n", "<A-z>", function()
  require("trouble").toggle()
end, { desc = "Open Trouble" })

map("n", "<leader>gz", function()
  vim.diagnostic.open_float()
end, { desc = "What" })

-- Increname
map("n", "<leader>cr", ":IncRename ", {})
map("n", "<leader>cn", function()
  return ":increname " .. vim.fn.expand "<cword>"
end, { expr = true })

-- Undo Tree
map("n", "<A-u>", vim.cmd.UndotreeToggle, { desc = "Open undor tree" })

-- NOICE
map("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Notification" })
map("n", "<leader>nh", "<cmd>NoiceTelescope<CR>", { desc = "Noice History" })

-- FTerm
map("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>')
map("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- Obsidian
map("n", "<F12>", "<CMD>ZenMode<CR>", { desc = "Zen Mode" })
map("n", "<leader>o", ":Obsidian", { desc = "Obsidian" })
map("n", "<leader>on", "<CMD>ObsidianNew<CR>", { desc = "Obsidian" })

-- Java
map("n", "<leader>jj", "<cmd>JavaRunnerRunMain<CR>", { desc = "Run Java Main" })
map("n", "<leader>ja", "<cmd>JavaRunnerToggleLogs<CR>", { desc = "Run Java Main" })

map("n", "<leader>jt", function()
  require("neotest").run.run(vim.fn.expand "%")
end, { desc = "Run NeoTest" })

map("n", "<leader>jD", function()
  require("jdtls.dap").test_class()
end, { desc = "Test Nearest Class" })

map("n", "<leader>jd", function()
  require("jdtls.dap").test_nearest_method()
end, { desc = "Test Nearest Method" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
