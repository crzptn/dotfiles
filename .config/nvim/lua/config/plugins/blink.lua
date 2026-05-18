return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		event = { "InsertEnter" },
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		opts = {
			keymap = {
				preset = "default",
				-- ["<CR>"] = { "accept", "fallback" },
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			signature = {
				enabled = true,
			},
			fuzzy = {
				implementation = "prefer_rust_with_warning",
			},
		},
	},
}
