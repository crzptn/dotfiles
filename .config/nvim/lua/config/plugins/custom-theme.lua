return {
	{
		name = "custom-theme",
		dir = vim.fn.stdpath("config"),
		lazy = false,
		priority = 1100,
		config = function()
			local palette = {
				bg = "#00001c",
				fg = "#f8e8c8",
				fg_dim = "#a8a8bf",
				comment = "#6b6b7a",
				keyword = "#ffb347",
				string = "#ffd97a",
				type = "#ffcc66",
				number = "#ff9966",
				func = "#ffc266",
				identifier = "#68d4d4",
				member = "#a8e8e8",
				operator = "#f8e8c8",
				cursor = "#ffffff",
				selection = "#333355",
				statusbg = "#111133",
				menu = "#1a1a3a",
				cursorline = "#0a0a30",
				border = "#30305a",
				error = "#ff5555",
				warn = "#ffaa33",
				info = "#88ccff",
				hint = "#88ffcc",
				added = "#44ff88",
				removed = "#ff4466",
				changed = "#ffaa44",
			}

			vim.o.termguicolors = true
			vim.o.background = "dark"
			vim.cmd("highlight clear")
			if vim.fn.exists("syntax_on") == 1 then
				vim.cmd("syntax reset")
			end
			vim.g.colors_name = "custom-midnight"

			local hl = vim.api.nvim_set_hl

			-- UI
			hl(0, "Normal", { fg = palette.fg, bg = palette.bg })
			hl(0, "NormalNC", { fg = palette.fg_dim, bg = palette.bg })
			hl(0, "NormalFloat", { fg = palette.fg, bg = palette.menu })
			hl(0, "FloatBorder", { fg = palette.border, bg = palette.menu })
			hl(0, "FloatTitle", { fg = palette.keyword, bg = palette.menu })
			hl(0, "SignColumn", { fg = palette.fg_dim, bg = palette.bg })
			hl(0, "FoldColumn", { fg = palette.fg_dim, bg = palette.bg })
			hl(0, "Folded", { fg = palette.fg_dim, bg = palette.cursorline })
			hl(0, "EndOfBuffer", { fg = palette.bg, bg = palette.bg })
			hl(0, "LineNr", { fg = palette.fg_dim, bg = palette.bg })
			hl(0, "LineNrAbove", { fg = palette.fg_dim })
			hl(0, "LineNrBelow", { fg = palette.fg_dim })
			hl(0, "CursorLineNr", { fg = palette.fg, bg = palette.cursorline, bold = true })
			hl(0, "CursorLine", { bg = palette.cursorline })
			hl(0, "CursorColumn", { bg = palette.cursorline })
			hl(0, "Cursor", { fg = palette.bg, bg = palette.cursor })
			hl(0, "lCursor", { fg = palette.bg, bg = palette.cursor })
			hl(0, "CursorIM", { fg = palette.bg, bg = palette.cursor })
			hl(0, "TermCursor", { fg = palette.bg, bg = palette.cursor })
			hl(0, "ColorColumn", { bg = palette.statusbg })
			hl(0, "WinSeparator", { fg = palette.border, bg = palette.bg })
			hl(0, "VertSplit", { fg = palette.border, bg = palette.bg })
			hl(0, "TabLine", { fg = palette.fg_dim, bg = palette.statusbg })
			hl(0, "TabLineFill", { bg = palette.statusbg })
			hl(0, "TabLineSel", { fg = palette.fg, bg = palette.bg, bold = true })
			hl(0, "StatusLine", { fg = palette.fg, bg = palette.statusbg })
			hl(0, "StatusLineNC", { fg = palette.fg_dim, bg = palette.statusbg })
			hl(0, "Visual", { bg = palette.selection })
			hl(0, "VisualNOS", { bg = palette.selection })
			hl(0, "Search", { fg = palette.bg, bg = palette.keyword })
			hl(0, "IncSearch", { fg = palette.bg, bg = palette.func })
			hl(0, "CurSearch", { fg = palette.bg, bg = palette.func })
			hl(0, "MatchParen", { fg = palette.func, underline = true })
			hl(0, "Pmenu", { fg = palette.fg, bg = palette.menu })
			hl(0, "PmenuSel", { fg = palette.bg, bg = palette.keyword })
			hl(0, "PmenuSbar", { bg = palette.statusbg })
			hl(0, "PmenuThumb", { bg = palette.keyword })
			hl(0, "WildMenu", { fg = palette.bg, bg = palette.keyword })
			hl(0, "Question", { fg = palette.info })
			hl(0, "MoreMsg", { fg = palette.info })
			hl(0, "ModeMsg", { fg = palette.fg })
			hl(0, "MsgArea", { fg = palette.fg })
			hl(0, "MsgSeparator", { fg = palette.border, bg = palette.statusbg })
			hl(0, "ErrorMsg", { fg = palette.error })
			hl(0, "WarningMsg", { fg = palette.warn })
			hl(0, "NonText", { fg = palette.fg_dim })
			hl(0, "Whitespace", { fg = palette.border })
			hl(0, "SpecialKey", { fg = palette.border })
			hl(0, "Conceal", { fg = palette.fg_dim })
			hl(0, "Directory", { fg = palette.identifier })
			hl(0, "Title", { fg = palette.keyword })
			hl(0, "QuickFixLine", { bg = palette.cursorline })
			hl(0, "SpellBad", { undercurl = true, sp = palette.error })
			hl(0, "SpellCap", { undercurl = true, sp = palette.warn })
			hl(0, "SpellRare", { undercurl = true, sp = palette.info })
			hl(0, "SpellLocal", { undercurl = true, sp = palette.hint })

			-- Diff
			hl(0, "DiffAdd", { fg = palette.added, bg = "#001a0d" })
			hl(0, "DiffChange", { fg = palette.changed, bg = "#1a0d00" })
			hl(0, "DiffDelete", { fg = palette.removed, bg = "#1a0007" })
			hl(0, "DiffText", { fg = palette.fg, bg = "#2a1500" })
			hl(0, "Added", { fg = palette.added })
			hl(0, "Changed", { fg = palette.changed })
			hl(0, "Removed", { fg = palette.removed })

			-- Diagnostics
			hl(0, "DiagnosticError", { fg = palette.error })
			hl(0, "DiagnosticWarn", { fg = palette.warn })
			hl(0, "DiagnosticInfo", { fg = palette.info })
			hl(0, "DiagnosticHint", { fg = palette.hint })
			hl(0, "DiagnosticOk", { fg = palette.added })
			hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = palette.error })
			hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = palette.warn })
			hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = palette.info })
			hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = palette.hint })
			hl(0, "DiagnosticVirtualTextError", { fg = palette.error, italic = true })
			hl(0, "DiagnosticVirtualTextWarn", { fg = palette.warn, italic = true })
			hl(0, "DiagnosticVirtualTextInfo", { fg = palette.info, italic = true })
			hl(0, "DiagnosticVirtualTextHint", { fg = palette.hint, italic = true })
			hl(0, "DiagnosticSignError", { fg = palette.error })
			hl(0, "DiagnosticSignWarn", { fg = palette.warn })
			hl(0, "DiagnosticSignInfo", { fg = palette.info })
			hl(0, "DiagnosticSignHint", { fg = palette.hint })

			-- Base syntax
			hl(0, "Comment", { fg = palette.comment, italic = true })
			hl(0, "Constant", { fg = palette.number })
			hl(0, "String", { fg = palette.string })
			hl(0, "Character", { fg = palette.string })
			hl(0, "Number", { fg = palette.number })
			hl(0, "Float", { fg = palette.number })
			hl(0, "Boolean", { fg = palette.keyword })
			hl(0, "Identifier", { fg = palette.fg })
			hl(0, "Function", { fg = palette.fg })
			hl(0, "Statement", { fg = palette.keyword })
			hl(0, "Conditional", { fg = palette.keyword })
			hl(0, "Repeat", { fg = palette.keyword })
			hl(0, "Label", { fg = palette.keyword })
			hl(0, "Operator", { fg = palette.operator })
			hl(0, "Keyword", { fg = palette.keyword })
			hl(0, "Exception", { fg = palette.keyword })
			hl(0, "PreProc", { fg = palette.keyword })
			hl(0, "Include", { fg = palette.keyword })
			hl(0, "Define", { fg = palette.keyword })
			hl(0, "Macro", { fg = palette.func })
			hl(0, "PreCondit", { fg = palette.keyword })
			hl(0, "Type", { fg = palette.type })
			hl(0, "StorageClass", { fg = palette.keyword })
			hl(0, "Structure", { fg = palette.keyword })
			hl(0, "Typedef", { fg = palette.keyword })
			hl(0, "Special", { fg = palette.func })
			hl(0, "SpecialChar", { fg = palette.number })
			hl(0, "Tag", { fg = palette.keyword })
			hl(0, "Delimiter", { fg = palette.fg })
			hl(0, "SpecialComment", { fg = palette.comment })
			hl(0, "Debug", { fg = palette.warn })
			hl(0, "Underlined", { underline = true })
			hl(0, "Ignore", { fg = palette.fg_dim })
			hl(0, "Error", { fg = palette.error, bold = true })
			hl(0, "Todo", { fg = palette.bg, bg = palette.comment, bold = true })

			-- Treesitter
			hl(0, "@comment", { fg = palette.comment, italic = true })
			hl(0, "@comment.documentation", { fg = palette.comment, italic = true })
			hl(0, "@comment.todo", { fg = palette.bg, bg = palette.comment, bold = true })
			hl(0, "@comment.note", { fg = palette.info, bold = true })
			hl(0, "@comment.warning", { fg = palette.warn, bold = true })
			hl(0, "@comment.error", { fg = palette.error, bold = true })

			hl(0, "@keyword", { fg = palette.keyword })
			hl(0, "@keyword.return", { fg = palette.keyword })
			hl(0, "@keyword.conditional", { fg = palette.keyword })
			hl(0, "@keyword.conditional.ternary", { fg = palette.operator })
			hl(0, "@keyword.repeat", { fg = palette.keyword })
			hl(0, "@keyword.exception", { fg = palette.keyword })
			hl(0, "@keyword.import", { fg = palette.keyword })
			hl(0, "@keyword.directive", { fg = palette.keyword })
			hl(0, "@keyword.directive.define", { fg = palette.keyword })
			hl(0, "@keyword.storage", { fg = palette.keyword })
			hl(0, "@keyword.type", { fg = palette.keyword })
			hl(0, "@keyword.modifier", { fg = palette.keyword })
			hl(0, "@keyword.coroutine", { fg = palette.keyword })
			hl(0, "@keyword.function", { fg = palette.keyword })
			hl(0, "@keyword.operator", { fg = palette.keyword })
			hl(0, "@keyword.debug", { fg = palette.warn })

			hl(0, "@function", { fg = palette.fg })
			hl(0, "@function.call", { fg = palette.fg })
			hl(0, "@function.builtin", { fg = palette.fg, italic = true })
			hl(0, "@function.macro", { fg = palette.func })
			hl(0, "@function.method", { fg = palette.fg })
			hl(0, "@function.method.call", { fg = palette.fg })
			hl(0, "@method", { fg = palette.fg })
			hl(0, "@method.call", { fg = palette.fg })

			hl(0, "@constructor", { fg = palette.fg })

			hl(0, "@variable", { fg = palette.fg })
			hl(0, "@variable.builtin", { fg = palette.keyword })
			hl(0, "@variable.parameter", { fg = palette.fg })
			hl(0, "@variable.parameter.builtin", { fg = palette.keyword })
			hl(0, "@variable.member", { fg = palette.member })
			hl(0, "@field", { fg = palette.member })
			hl(0, "@property", { fg = palette.member })
			hl(0, "@parameter", { fg = palette.fg })

			hl(0, "@type", { fg = palette.fg })
			hl(0, "@type.builtin", { fg = palette.identifier })
			hl(0, "@type.qualifier", { fg = palette.keyword })
			hl(0, "@type.definition", { fg = palette.fg })
			hl(0, "@lsp.type.struct", { fg = palette.fg })
			hl(0, "@lsp.type.type", { fg = palette.fg })
			hl(0, "@lsp.type.class", { fg = palette.fg })
			hl(0, "@lsp.type.interface", { fg = palette.fg })
			hl(0, "@lsp.type.enum", { fg = palette.fg })

			hl(0, "@constant", { fg = palette.number })
			hl(0, "@constant.builtin", { fg = palette.keyword })
			hl(0, "@constant.macro", { fg = palette.func })

			hl(0, "@string", { fg = palette.string })
			hl(0, "@string.escape", { fg = palette.number })
			hl(0, "@string.special", { fg = palette.number })
			hl(0, "@string.special.symbol", { fg = palette.number })
			hl(0, "@string.special.url", { fg = palette.info, underline = true })
			hl(0, "@string.regexp", { fg = palette.number })
			hl(0, "@string.documentation", { fg = palette.comment })
			hl(0, "@character", { fg = palette.string })
			hl(0, "@character.special", { fg = palette.number })
			hl(0, "@number", { fg = palette.number })
			hl(0, "@number.float", { fg = palette.number })
			hl(0, "@float", { fg = palette.number })
			hl(0, "@boolean", { fg = palette.keyword })

			hl(0, "@operator", { fg = palette.operator })
			hl(0, "@punctuation.bracket", { fg = palette.fg })
			hl(0, "@punctuation.delimiter", { fg = palette.fg })
			hl(0, "@punctuation.special", { fg = palette.operator })

			hl(0, "@module", { fg = palette.identifier })
			hl(0, "@module.builtin", { fg = palette.keyword })
			hl(0, "@namespace", { fg = palette.identifier })
			hl(0, "@label", { fg = palette.keyword })

			hl(0, "@tag", { fg = palette.keyword })
			hl(0, "@tag.builtin", { fg = palette.keyword })
			hl(0, "@tag.attribute", { fg = palette.member })
			hl(0, "@tag.delimiter", { fg = palette.fg_dim })

			hl(0, "@diff.plus", { fg = palette.added })
			hl(0, "@diff.minus", { fg = palette.removed })
			hl(0, "@diff.delta", { fg = palette.changed })

			hl(0, "@markup.heading", { fg = palette.keyword, bold = true })
			hl(0, "@markup.heading.1", { fg = palette.keyword, bold = true })
			hl(0, "@markup.heading.2", { fg = palette.func, bold = true })
			hl(0, "@markup.heading.3", { fg = palette.type, bold = true })
			hl(0, "@markup.heading.4", { fg = palette.string, bold = true })
			hl(0, "@markup.heading.5", { fg = palette.member })
			hl(0, "@markup.heading.6", { fg = palette.fg_dim })
			hl(0, "@markup.bold", { bold = true })
			hl(0, "@markup.italic", { italic = true })
			hl(0, "@markup.strikethrough", { strikethrough = true })
			hl(0, "@markup.underline", { underline = true })
			hl(0, "@markup.link", { fg = palette.info, underline = true })
			hl(0, "@markup.link.label", { fg = palette.member })
			hl(0, "@markup.link.url", { fg = palette.info, underline = true })
			hl(0, "@markup.raw", { fg = palette.string })
			hl(0, "@markup.raw.block", { fg = palette.string })
			hl(0, "@markup.quote", { fg = palette.comment, italic = true })
			hl(0, "@markup.list", { fg = palette.keyword })
			hl(0, "@markup.list.checked", { fg = palette.added })
			hl(0, "@markup.list.unchecked", { fg = palette.fg_dim })

			-- LSP semantic tokens
			hl(0, "@lsp.type.comment", { fg = palette.comment, italic = true })
			hl(0, "@lsp.type.decorator", { fg = palette.func })
			hl(0, "@lsp.type.enumMember", { fg = palette.number })
			hl(0, "@lsp.type.event", { fg = palette.member })
			hl(0, "@lsp.type.function", { fg = palette.fg })
			hl(0, "@lsp.type.keyword", { fg = palette.keyword })
			hl(0, "@lsp.type.macro", { fg = palette.func })
			hl(0, "@lsp.type.method", { fg = palette.fg })
			hl(0, "@lsp.type.modifier", { fg = palette.keyword })
			hl(0, "@lsp.type.namespace", { fg = palette.fg })
			hl(0, "@lsp.type.number", { fg = palette.number })
			hl(0, "@lsp.type.operator", { fg = palette.operator })
			hl(0, "@lsp.type.parameter", { fg = palette.fg })
			hl(0, "@lsp.type.property", { fg = palette.member })
			hl(0, "@lsp.type.regexp", { fg = palette.number })
			hl(0, "@lsp.type.string", { fg = palette.string })
			hl(0, "@lsp.type.variable", { fg = palette.fg })
			hl(0, "@lsp.type.selfKeyword", { fg = palette.keyword })
			hl(0, "@lsp.type.builtinType", { fg = palette.identifier })

			hl(0, "@lsp.typemod.class.defaultLibrary", { fg = palette.fg })
			hl(0, "@lsp.typemod.function.defaultLibrary", { fg = palette.fg, italic = true })
			hl(0, "@lsp.typemod.method.defaultLibrary", { fg = palette.fg, italic = true })
			hl(0, "@lsp.typemod.keyword.async", { fg = palette.keyword })
			hl(0, "@lsp.typemod.type.defaultLibrary", { fg = palette.fg })

			-- Language-specific overrides
			hl(0, "@keyword.directive.c", { fg = palette.keyword })
			hl(0, "@keyword.directive.cpp", { fg = palette.keyword })
			hl(0, "@type.builtin.c", { fg = palette.identifier })
			hl(0, "@type.builtin.cpp", { fg = palette.identifier })
			hl(0, "@keyword.storage.c", { fg = palette.keyword })
			hl(0, "@keyword.storage.cpp", { fg = palette.keyword })

			hl(0, "@keyword.import.python", { fg = palette.keyword })
			hl(0, "@type.builtin.python", { fg = palette.identifier })
			hl(0, "@variable.builtin.python", { fg = palette.keyword })
			hl(0, "@constant.builtin.python", { fg = palette.keyword })
			hl(0, "@attribute.python", { fg = palette.func, italic = true })

			hl(0, "@type.builtin.rust", { fg = palette.identifier })
			hl(0, "@keyword.storage.rust", { fg = palette.keyword })
			hl(0, "@constant.builtin.rust", { fg = palette.keyword })
			hl(0, "@lsp.type.lifetime", { fg = palette.keyword, italic = true })
			hl(0, "@lsp.typemod.variable.mutable.rust", { underline = true })

			hl(0, "@type.builtin.go", { fg = palette.identifier })
			hl(0, "@keyword.import.go", { fg = palette.keyword })

			hl(0, "@keyword.import.javascript", { fg = palette.keyword })
			hl(0, "@keyword.import.typescript", { fg = palette.keyword })
			hl(0, "@variable.builtin.javascript", { fg = palette.keyword })
			hl(0, "@variable.builtin.typescript", { fg = palette.keyword })
			hl(0, "@constant.builtin.javascript", { fg = palette.keyword })
			hl(0, "@constant.builtin.typescript", { fg = palette.keyword })
			hl(0, "@type.builtin.typescript", { fg = palette.identifier })

			hl(0, "@lsp.typemod.variable.defaultLibrary", { fg = palette.keyword })
			hl(0, "@lsp.typemod.variable.readonly", { fg = palette.number })
			hl(0, "@lsp.typemod.variable.global", { fg = palette.fg })

			hl(0, "@variable.builtin.lua", { fg = palette.keyword })
			hl(0, "@constant.builtin.lua", { fg = palette.keyword })

			hl(0, "@tag.html", { fg = palette.keyword })
			hl(0, "@tag.jsx", { fg = palette.keyword })
			hl(0, "@tag.tsx", { fg = palette.keyword })
			hl(0, "@tag.attribute.html", { fg = palette.member })
			hl(0, "@tag.attribute.jsx", { fg = palette.member })
			hl(0, "@tag.attribute.tsx", { fg = palette.member })

			hl(0, "@property.css", { fg = palette.member })
			hl(0, "@string.css", { fg = palette.string })
			hl(0, "@number.css", { fg = palette.number })
			hl(0, "@keyword.css", { fg = palette.keyword })
			hl(0, "@type.css", { fg = palette.func })

			hl(0, "@function.builtin.bash", { fg = palette.fg, italic = true })
			hl(0, "@keyword.directive.bash", { fg = palette.keyword })

			hl(0, "@label.json", { fg = palette.member })
			hl(0, "@string.json", { fg = palette.string })
			hl(0, "@number.json", { fg = palette.number })
			hl(0, "@constant.builtin.json", { fg = palette.keyword })

			hl(0, "@field.yaml", { fg = palette.member })
			hl(0, "@string.yaml", { fg = palette.string })

			hl(0, "@property.toml", { fg = palette.member })
			hl(0, "@string.toml", { fg = palette.string })

			hl(0, "@markup.heading.marker", { fg = palette.fg_dim })
			hl(0, "@markup.quote.markdown", { fg = palette.comment, italic = true })
			hl(0, "@markup.raw.markdown_inline", { fg = palette.string })
			hl(0, "@markup.link.markdown_inline", { fg = palette.info, underline = true })

			hl(0, "@keyword.sql", { fg = palette.keyword })
			hl(0, "@type.sql", { fg = palette.type })
			hl(0, "@function.sql", { fg = palette.fg })

			-- Plugin highlights
			hl(0, "NvimTreeNormal", { fg = palette.fg, bg = palette.bg })
			hl(0, "NvimTreeFolderIcon", { fg = palette.keyword })
			hl(0, "NvimTreeFolderName", { fg = palette.identifier })
			hl(0, "NvimTreeOpenedFolderName", { fg = palette.func })
			hl(0, "NvimTreeRootFolder", { fg = palette.keyword })
			hl(0, "NvimTreeGitDirty", { fg = palette.changed })
			hl(0, "NvimTreeGitAdded", { fg = palette.added })
			hl(0, "NvimTreeGitDeleted", { fg = palette.removed })

			hl(0, "TelescopeNormal", { fg = palette.fg, bg = palette.menu })
			hl(0, "TelescopeBorder", { fg = palette.border, bg = palette.menu })
			hl(0, "TelescopePromptBorder", { fg = palette.keyword, bg = palette.menu })
			hl(0, "TelescopeSelection", { fg = palette.fg, bg = palette.selection })
			hl(0, "TelescopeMatching", { fg = palette.func })
			hl(0, "TelescopePromptPrefix", { fg = palette.keyword })

			hl(0, "GitSignsAdd", { fg = palette.added })
			hl(0, "GitSignsChange", { fg = palette.changed })
			hl(0, "GitSignsDelete", { fg = palette.removed })

			hl(0, "IblIndent", { fg = palette.border })
			hl(0, "IblScope", { fg = palette.fg_dim })
			hl(0, "IndentBlanklineChar", { fg = palette.border })
			hl(0, "IndentBlanklineContextChar", { fg = palette.fg_dim })

			hl(0, "CmpItemAbbr", { fg = palette.fg })
			hl(0, "CmpItemAbbrMatch", { fg = palette.func })
			hl(0, "CmpItemAbbrMatchFuzzy", { fg = palette.func })
			hl(0, "CmpItemKindFunction", { fg = palette.func })
			hl(0, "CmpItemKindMethod", { fg = palette.func })
			hl(0, "CmpItemKindVariable", { fg = palette.identifier })
			hl(0, "CmpItemKindField", { fg = palette.member })
			hl(0, "CmpItemKindKeyword", { fg = palette.keyword })
			hl(0, "CmpItemKindClass", { fg = palette.type })
			hl(0, "CmpItemKindInterface", { fg = palette.type })
			hl(0, "CmpItemKindStruct", { fg = palette.type })
			hl(0, "CmpItemKindSnippet", { fg = palette.string })
			hl(0, "CmpItemKindText", { fg = palette.fg_dim })
			hl(0, "CmpItemMenu", { fg = palette.fg_dim, italic = true })

			hl(0, "WhichKey", { fg = palette.keyword })
			hl(0, "WhichKeyGroup", { fg = palette.func })
			hl(0, "WhichKeyDesc", { fg = palette.fg })
			hl(0, "WhichKeyBorder", { fg = palette.border })
			hl(0, "WhichKeyNormal", { bg = palette.menu })
		end,
	},
}
