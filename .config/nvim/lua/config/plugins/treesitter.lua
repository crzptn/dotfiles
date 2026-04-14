return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = 'master',
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup {
				ensure_installed = { "lua", "vim", "vimdoc", "bash", "python", "javascript", "typescript", "json", "yaml", "markdown", "go", "c", "rust", "zig", "vue", "css", "bash" },
				highlight = { enable = true },
				indent = { enable = true },
				auto_install = false,
			}
		end
	}
}
