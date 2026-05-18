return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		event = "BufReadPost",
		ft = "markdown",
		opts = {
			debounce = 100,
			hover = {
				enabled = false,
			},
		},
	},
}
