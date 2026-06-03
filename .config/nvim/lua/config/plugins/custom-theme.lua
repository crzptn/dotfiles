return {
	{
		name = "custom-theme",
		dir = vim.fn.stdpath("config"),
		lazy = false,
		priority = 1100,
		config = function()
			local p = {
				bg         = "#00001c",
				fg         = "#f8e8c8",
				fg_dim     = "#a8a8bf",
				comment    = "#6b6b7a",
				keyword    = "#ffb347",
				string     = "#ffd97a",
				type       = "#ffcc66",
				number     = "#ff9966",
				func       = "#ffc266",
				identifier = "#68d4d4",
				member     = "#a8e8e8",
				operator   = "#f8e8c8",
				cursor     = "#ffffff",
				selection  = "#333355",
				statusbg   = "#111133",
				menu       = "#1a1a3a",
				cursorline = "#0a0a30",
				border     = "#30305a",
				error      = "#ff5555",
				warn       = "#ffaa33",
				info       = "#88ccff",
				hint       = "#88ffcc",
				added      = "#44ff88",
				removed    = "#ff4466",
				changed    = "#ffaa44",
			}

			vim.o.termguicolors = true
			vim.o.background = "dark"
			vim.cmd("highlight clear")
			if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
			vim.g.colors_name = "custom-midnight"

			local hl = vim.api.nvim_set_hl

			-- UI
			hl(0, "Normal", { fg = p.fg, bg = p.bg })
			hl(0, "NormalNC", { fg = p.fg_dim, bg = p.bg })
			hl(0, "NormalFloat", { fg = p.fg, bg = p.menu })
			hl(0, "FloatBorder", { fg = p.border, bg = p.menu })
			hl(0, "FloatTitle", { fg = p.keyword, bg = p.menu })
			hl(0, "SignColumn", { fg = p.fg_dim, bg = p.bg })
			hl(0, "FoldColumn", { fg = p.fg_dim, bg = p.bg })
			hl(0, "Folded", { fg = p.fg_dim, bg = p.cursorline })
			hl(0, "EndOfBuffer", { fg = p.bg, bg = p.bg })
			hl(0, "LineNr", { fg = p.fg_dim, bg = p.bg })
			hl(0, "CursorLineNr", { fg = p.fg, bg = p.cursorline, bold = true })
			hl(0, "CursorLine", { bg = p.cursorline })
			hl(0, "ColorColumn", { bg = p.statusbg })
			hl(0, "WinSeparator", { fg = p.border, bg = p.bg })
			hl(0, "TabLine", { fg = p.fg_dim, bg = p.statusbg })
			hl(0, "TabLineFill", { bg = p.statusbg })
			hl(0, "TabLineSel", { fg = p.fg, bg = p.bg, bold = true })
			hl(0, "StatusLine", { fg = p.fg, bg = p.statusbg })
			hl(0, "StatusLineNC", { fg = p.fg_dim, bg = p.statusbg })
			hl(0, "Visual", { bg = p.selection })
			hl(0, "Search", { fg = p.bg, bg = p.keyword })
			hl(0, "IncSearch", { fg = p.bg, bg = p.func })
			hl(0, "CurSearch", { fg = p.bg, bg = p.func })
			hl(0, "MatchParen", { fg = p.func, underline = true })
			hl(0, "Pmenu", { fg = p.fg, bg = p.menu })
			hl(0, "PmenuSel", { fg = p.bg, bg = p.keyword })
			hl(0, "PmenuSbar", { bg = p.statusbg })
			hl(0, "PmenuThumb", { bg = p.keyword })
			hl(0, "Question", { fg = p.info })
			hl(0, "MoreMsg", { fg = p.info })
			hl(0, "ErrorMsg", { fg = p.error })
			hl(0, "WarningMsg", { fg = p.warn })
			hl(0, "NonText", { fg = p.fg_dim })
			hl(0, "Whitespace", { fg = p.border })
			hl(0, "SpecialKey", { fg = p.border })
			hl(0, "Directory", { fg = p.identifier })
			hl(0, "Title", { fg = p.keyword })
			hl(0, "SpellBad", { undercurl = true, sp = p.error })
			hl(0, "SpellCap", { undercurl = true, sp = p.warn })
			hl(0, "SpellRare", { undercurl = true, sp = p.info })
			hl(0, "SpellLocal", { undercurl = true, sp = p.hint })

			-- diff
			hl(0, "DiffAdd", { fg = p.added, bg = "#001a0d" })
			hl(0, "DiffChange", { fg = p.changed, bg = "#1a0d00" })
			hl(0, "DiffDelete", { fg = p.removed, bg = "#1a0007" })
			hl(0, "DiffText", { fg = p.fg, bg = "#2a1500" })
			hl(0, "Added", { fg = p.added })
			hl(0, "Changed", { fg = p.changed })
			hl(0, "Removed", { fg = p.removed })

			-- diagnostics
			hl(0, "DiagnosticError", { fg = p.error })
			hl(0, "DiagnosticWarn", { fg = p.warn })
			hl(0, "DiagnosticInfo", { fg = p.info })
			hl(0, "DiagnosticHint", { fg = p.hint })
			hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = p.error })
			hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = p.warn })
			hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = p.info })
			hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = p.hint })
			hl(0, "DiagnosticVirtualTextError", { fg = p.error, italic = true })
			hl(0, "DiagnosticVirtualTextWarn", { fg = p.warn, italic = true })
			hl(0, "DiagnosticVirtualTextInfo", { fg = p.info, italic = true })
			hl(0, "DiagnosticVirtualTextHint", { fg = p.hint, italic = true })

			-- base syntax (non-treesitter fallback)
			hl(0, "Comment", { fg = p.comment, italic = true })
			hl(0, "Constant", { fg = p.number })
			hl(0, "String", { fg = p.string })
			hl(0, "Number", { fg = p.number })
			hl(0, "Boolean", { fg = p.keyword })
			hl(0, "Identifier", { fg = p.fg })
			hl(0, "Function", { fg = p.fg })
			hl(0, "Keyword", { fg = p.keyword })
			hl(0, "Statement", { fg = p.keyword })
			hl(0, "Type", { fg = p.type })
			hl(0, "PreProc", { fg = p.keyword })
			hl(0, "Macro", { fg = p.func })
			hl(0, "Special", { fg = p.func })
			hl(0, "Delimiter", { fg = p.fg })
			hl(0, "Operator", { fg = p.operator })
			hl(0, "Error", { fg = p.error, bold = true })
			hl(0, "Todo", { fg = p.bg, bg = p.comment, bold = true })
			hl(0, "Underlined", { underline = true })
			hl(0, "Ignore", { fg = p.fg_dim })

			-- Treesitter
			hl(0, "@comment", { fg = p.comment, italic = true })
			hl(0, "@comment.todo", { fg = p.bg, bg = p.comment, bold = true })
			hl(0, "@comment.note", { fg = p.info, bold = true })
			hl(0, "@comment.warning", { fg = p.warn, bold = true })
			hl(0, "@comment.error", { fg = p.error, bold = true })

			hl(0, "@keyword", { fg = p.keyword })
			hl(0, "@keyword.operator", { fg = p.keyword })
			hl(0, "@keyword.function", { fg = p.keyword })
			hl(0, "@keyword.conditional.ternary", { fg = p.operator })

			hl(0, "@function", { fg = p.fg })
			hl(0, "@function.builtin", { fg = p.fg, italic = true })
			hl(0, "@function.macro", { fg = p.func })
			hl(0, "@function.method", { fg = p.fg })

			hl(0, "@variable", { fg = p.fg })
			hl(0, "@variable.builtin", { fg = p.keyword })
			hl(0, "@variable.member", { fg = p.member })

			hl(0, "@type", { fg = p.fg })
			hl(0, "@type.builtin", { fg = p.identifier })
			hl(0, "@type.qualifier", { fg = p.keyword })

			hl(0, "@constant", { fg = p.number })
			hl(0, "@constant.builtin", { fg = p.keyword })
			hl(0, "@constant.macro", { fg = p.func })

			hl(0, "@string", { fg = p.string })
			hl(0, "@string.escape", { fg = p.number })
			hl(0, "@string.special.url", { fg = p.info, underline = true })
			hl(0, "@string.regexp", { fg = p.number })
			hl(0, "@number", { fg = p.number })
			hl(0, "@boolean", { fg = p.keyword })

			hl(0, "@operator", { fg = p.operator })
			hl(0, "@punctuation.bracket", { fg = p.fg })
			hl(0, "@punctuation.delimiter", { fg = p.fg })
			hl(0, "@punctuation.special", { fg = p.operator })

			hl(0, "@module", { fg = p.identifier })
			hl(0, "@label", { fg = p.keyword })

			hl(0, "@tag", { fg = p.keyword })
			hl(0, "@tag.attribute", { fg = p.member })
			hl(0, "@tag.delimiter", { fg = p.fg_dim })

			hl(0, "@diff.plus", { fg = p.added })
			hl(0, "@diff.minus", { fg = p.removed })
			hl(0, "@diff.delta", { fg = p.changed })

			hl(0, "@markup.heading", { fg = p.keyword, bold = true })
			hl(0, "@markup.heading.2", { fg = p.func, bold = true })
			hl(0, "@markup.heading.3", { fg = p.type, bold = true })
			hl(0, "@markup.heading.4", { fg = p.string, bold = true })
			hl(0, "@markup.bold", { bold = true })
			hl(0, "@markup.italic", { italic = true })
			hl(0, "@markup.strikethrough", { strikethrough = true })
			hl(0, "@markup.link", { fg = p.info, underline = true })
			hl(0, "@markup.link.label", { fg = p.member })
			hl(0, "@markup.raw", { fg = p.string })
			hl(0, "@markup.quote", { fg = p.comment, italic = true })
			hl(0, "@markup.list", { fg = p.keyword })
			hl(0, "@markup.list.checked", { fg = p.added })
			hl(0, "@markup.list.unchecked", { fg = p.fg_dim })

			-- LSP semantic tokens (essentials only)
			hl(0, "@lsp.type.comment", { fg = p.comment, italic = true })
			hl(0, "@lsp.type.decorator", { fg = p.func })
			hl(0, "@lsp.type.enumMember", { fg = p.number })
			hl(0, "@lsp.type.keyword", { fg = p.keyword })
			hl(0, "@lsp.type.macro", { fg = p.func })
			hl(0, "@lsp.type.property", { fg = p.member })
			hl(0, "@lsp.type.string", { fg = p.string })
			hl(0, "@lsp.type.lifetime", { fg = p.keyword, italic = true })
			hl(0, "@lsp.typemod.variable.mutable.rust", { underline = true })
			hl(0, "@lsp.typemod.variable.readonly", { fg = p.number })
			hl(0, "@lsp.typemod.function.defaultLibrary", { fg = p.fg, italic = true })
		end,
	},
}
