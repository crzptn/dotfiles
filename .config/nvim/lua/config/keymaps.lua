local function confirm_tabclose()
	if vim.bo.modified then
		vim.ui.select({ "Yes", "No" }, {
			prompt = "Save changes?",
		}, function(choice)
			if choice == "Yes" then
				vim.cmd("w | tabclose")
			elseif choice == "No" then
				vim.cmd("tabclose")
			end
		end)
		return
	end

	vim.cmd("tabclose")
end

vim.keymap.set("n", "dn", vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set("n", "tx", confirm_tabclose, { noremap = true, silent = true })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })
vim.keymap.set("n", "<space>x", "<cmd>source %<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "tn", "<cmd>tabnext<CR>", { noremap = true, silent = true })
