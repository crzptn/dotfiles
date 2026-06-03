return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		keys = {
			{
				"<space>fw",
				function()
					require("config.telescope.multigrep").live_multigrep()
				end,
				desc = "Find word (multigrep)",
			},
			{
				"<space>ep",
				function()
					local builtin = require("telescope.builtin")
					local actions = require("telescope.actions")
					builtin.find_files({
						cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
						attach_mappings = function(_, map)
							map("i", "<CR>", actions.select_tab)
							return true
						end,
					})
				end,
				desc = "Browse lazy plugins",
			},
			{
				"<space>en",
				function()
					local builtin = require("telescope.builtin")
					local actions = require("telescope.actions")
					builtin.find_files({
						cwd = vim.fn.stdpath("config"),
						attach_mappings = function(_, map)
							map("i", "<CR>", actions.select_tab)
							return true
						end,
					})
				end,
				desc = "Edit nvim config",
			},
			{
				"<space>ff",
				function()
					local builtin = require("telescope.builtin")
					local actions = require("telescope.actions")

					builtin.find_files({
						attach_mappings = function(prompt_bufnr)
							actions.select_default:replace(function()
								actions.select_tab(prompt_bufnr)
							end)

							return true
						end,
					})
				end,
				desc = "Find files"
			},
		},
		config = function()
			local action_state = require("telescope.actions.state")

			local function paste_unnamed_register_into_prompt(prompt_bufnr)
				local picker = action_state.get_current_picker(prompt_bufnr)
				local text = vim.fn.getreg('"')
				picker:set_prompt(text)
			end

			require("telescope").setup({
				defaults = {
					mappings = {
						n = {
							p = paste_unnamed_register_into_prompt,
						},
					},
					file_ignore_patterns = {
						"node_modules",
						".git/",
						".venv",
					},
				},
				pickers = {
					find_files = {
						find_command = {
							"rg",
							"--files",
							"--hidden",
							"--glob",
							"!**/.git/*",
						},
					},
				},
				extensions = {
					fzf = {},
				},
			})

			require("config.telescope.multigrep").setup()
			require("telescope").load_extension("fzf")
		end,
	},
}
