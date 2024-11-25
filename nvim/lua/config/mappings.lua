-- Helper function for setting descriptions
local function Desc (desc)
    return { desc = desc }
end

-- Always allow Ctrl+HJKL in all modes
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("n", "<C-j>", "<Down>")
vim.keymap.set("n", "<C-k>", "<Up>")

-- Keep the screen centered when using these motions
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", Desc("Move selected text down a line"))
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", Desc("Move selected text up a line"))

-- Register shenanigans
vim.keymap.set("x", "<leader>p", [["_dP]], Desc("Paste without losing register"))
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], Desc("Yank into system clipboard"))
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], Desc("Delete to discard register"))

-- QOL
vim.keymap.set("i", "<C-c>", "<esc>") -- Ctrl + C == Esc
vim.keymap.set("n", "Q", "<nop>") -- Disable Q
vim.keymap.set("n", "J", "mzJ`z") -- Keep cursor in place during J
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], Desc("Search & replace the word that the cursor is on"))
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Add execute permission to file in buffer" })
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true }) -- Disable space action (leave it for leader)
vim.keymap.set("n", "<leader>n", ":Neoformat<CR>", Desc("Neoformat"))
vim.keymap.set("n", "gh", ":help <C-r><C-w><CR>", Desc("Goto help files (horizontal)"))
vim.keymap.set("n", "gvh", ":vert help <C-r><C-w><CR>", Desc("Goto help files (vertical)"))
vim.keymap.set("n", "<leader>t", function()
    local input = vim.fn.input("Enter tab width: ")
    local value = tonumber(input)
    if (value) then
	vim.opt.tabstop = 8
	vim.opt.softtabstop = value
	vim.opt.shiftwidth = value
	vim.opt.expandtab = false
	print("Tab width set to: " .. value)
    else
	print("Inavlid input, number expected.")
    end
end, Desc("Set tab width"))

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, Desc("Telescope find files"))
vim.keymap.set("n", "<leader><leader>", builtin.buffers, Desc("Telescope open buffers"))
vim.keymap.set("n", "<leader>fg", builtin.git_files, Desc("Telescope git files"))
vim.keymap.set("n", "<leader>/", function()
    builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
	winblend = 10,
	previewer = false,
    })
end, Desc("Telescope current buffer"))
vim.keymap.set("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", Desc("Telescope file browser"))

-- VimArduino
vim.keymap.set("n", "<leader>ai", "<cmd>ArduinoInfo<CR>", Desc("Display VimArduino plugin info"))
vim.keymap.set("n", "<leader>aa", "<cmd>ArduinoAttach<CR>", Desc("Automatically attach to board"))
vim.keymap.set("n", "<leader>ab", "<cmd>ArduinoChooseBoard<CR>", Desc("Choose arduino board"))
vim.keymap.set("n", "<leader>ar", "<cmd>ArduinoChooseProgrammer<CR>", Desc("Choose arduino programmer"))
vim.keymap.set("n", "<leader>ap", "<cmd>ArduinoChoosePort<CR>", Desc("Choose arduino port"))
vim.keymap.set("n", "<leader>av", "<cmd>ArduinoVerify<CR>", Desc("Build the sketch"))
vim.keymap.set("n", "<leader>au", "<cmd>ArduinoUpload<CR>", Desc("Build and upload the sketch"))
vim.keymap.set("n", "<leader>as", "<cmd>ArduinoSerial<CR>", Desc("Connect to the board over serial"))
vim.keymap.set("n", "<leader>al", "<cmd>ArduinoUploadAndSerial<CR>", Desc("Build, upload, and connect to the board over serial"))

-- Other plugins
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
