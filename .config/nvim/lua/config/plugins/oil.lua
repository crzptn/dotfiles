return {
	{
		"stevearc/oil.nvim",
		cmd = "Oil",
		keys = {
			{ "<C-n>", "<cmd>Oil<cr>", desc = "Open parent directory" },
		},
		opts = {
			view_options = {
				show_hidden = true,
				is_hidden_file = function()
					return false
				end,
				is_always_hidden = function(name)
					return name == ".." or name == ".venv" or name == "node_modules" or
					name == ".git"
				end,
			},
		},
	},
}
