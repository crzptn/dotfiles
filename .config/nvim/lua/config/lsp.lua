local unpack = unpack or table.unpack

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if not client:supports_method("textDocument/formatting") then
			return
		end
		if client:supports_method("textDocument/willSaveWaitUntil") then
			return
		end

		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = args.buf,
			callback = function()
				vim.lsp.buf.format({
					id = client.id,
					bufnr = args.buf,
					timeout_ms = 1000,
				})
			end,
		})
	end,
})

local vue_language_server_path = "/home/xn/.bun/install/global/node_modules/@vue/language-server"
local tsserver_filetypes = {
	"typescript",
	"javascript",
	"javascriptreact",
	"typescriptreact",
	"vue",
}

local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_language_server_path,
	languages = { "vue" },
	configNamespace = "typescript",
}

local function on_init(client)
	client.handlers["tsserver/request"] = function(_, result, context)
		local ts_clients = vim.lsp.get_clients({
			bufnr = context.bufnr,
			name = "vtsls",
		})

		ts_clients = vim.list_extend(ts_clients, vim.lsp.get_clients({
			bufnr = context.bufnr,
			name = "ts_ls",
		}))

		local ts_client = ts_clients[1]
		if not ts_client then
			vim.notify(
				"Could not find `vtsls` or `ts_ls` lsp client, `vue_ls` would not work without it.",
				vim.log.levels.ERROR
			)
			return
		end

		local param = unpack(result)
		local id, command, payload = unpack(param)

		ts_client:exec_cmd({
			title = "vue_request_forward",
			command = "typescript.tsserverRequest",
			arguments = { command, payload },
		}, {
			bufnr = context.bufnr,
		}, function(_, response)
			client:notify("tsserver/response", { { id, response.body } })
		end)
	end
end

local servers = {
	clangd = {
		cmd = { "clangd" },
		filetypes = { "c", "cpp" },
		root_markers = { ".git" },
	},
	kotlin_lsp = {
		cmd = { "kotlin-lsp" },
		filetypes = { "kotlin" },
		root_markers = {
			"settings.gradle",
			"settings.gradle.kts",
			"build.gradle",
			"build.gradle.kts",
			".git",
		},
	},
	rust_analyzer = {
		cmd = { "rust-analyzer" },
		filetypes = { "rust" },
		root_markers = { "Cargo.toml", ".git" },
	},
	gopls = {
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork", "gotmpl" },
		root_markers = { "go.work", "go.mod", ".git" },
	},
	tinymist = {
		cmd = { "tinymist" },
		filetypes = { "typst" },
		settings = {},
		root_markers = { ".git" },
	},
	lua_ls = {
		cmd = { "lua-language-server" },
		filetypes = { "lua" },
		root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
			},
		},
	},
	vtsls = {
		cmd = { "vtsls", "--stdio" },
		filetypes = tsserver_filetypes,
		root_markers = {
			"package.json",
			"tsconfig.json",
			"jsconfig.json",
			".git",
		},
		settings = {
			vtsls = {
				tsserver = {
					globalPlugins = { vue_plugin },
				},
			},
		},
	},
	vue_ls = {
		cmd = { "vue-language-server", "--stdio" },
		filetypes = { "vue" },
		on_init = on_init,
		root_markers = { "package.json", ".git" },
	},
}

local managed_servers = {
	"clangd",
	"kotlin_lsp",
	"rust_analyzer",
	"gopls",
	"tinymist",
	"lua_ls",
	"vtsls",
	"vue_ls",
}

for name, config in pairs(servers) do
	vim.lsp.config(name, config)
end

local lsp_stopped_servers = {}

local function servers_for_filetype(bufnr)
	local ft = vim.bo[bufnr].filetype
	local names = {}

	for _, server in ipairs(managed_servers) do
		local config = servers[server]
		if vim.tbl_contains(config.filetypes or {}, ft) then
			table.insert(names, server)
		end
	end

	return names
end

local function start_managed_servers()
	vim.lsp.enable(managed_servers)
end

vim.api.nvim_create_user_command("LspStart", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local started = {}

	for _, server in ipairs(servers_for_filetype(bufnr)) do
		vim.lsp.enable(server)
		lsp_stopped_servers[server] = nil
		table.insert(started, server)
	end

	if #started == 0 then
		vim.notify("LSPStart: no matching LSP server for this buffer", vim.log.levels.WARN)
		return
	end

	vim.notify(
		"LSPStart: started for current buffer -> " .. table.concat(started, ", "),
		vim.log.levels.WARN
	)
end, {})

vim.api.nvim_create_user_command("LspStop", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = bufnr })
	local names = {}

	if #clients == 0 then
		vim.notify("LSPStop: no active LSP client on current buffer", vim.log.levels.WARN)
		return
	end

	for _, client in ipairs(clients) do
		lsp_stopped_servers[client.name] = client.id
		table.insert(names, client.name)
		client:stop()
	end

	vim.notify(
		"LSPStop: stopped current buffer clients -> " .. table.concat(names, ", "),
		vim.log.levels.WARN
	)
end, {})

vim.api.nvim_create_user_command("LspInfo", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local active = vim.lsp.get_clients()
	local attached = vim.lsp.get_clients({ bufnr = bufnr })
	local lines = {}

	table.insert(lines, "Active clients (all buffers): ")
	for _, client in ipairs(active) do
		local root = client.config.root_dir or "N/A"
		table.insert(
			lines,
			string.format(
				"- %s (id=%d) root=%s buffers=%d",
				client.name,
				client.id,
				root,
				vim.tbl_count(client.attached_buffers or {})
			)
		)
	end

	table.insert(lines, "Attached clients (current buffer): ")
	for _, client in ipairs(attached) do
		local root = client.config.root_dir or "N/A"
		table.insert(lines, string.format("- %s (id=%d) root=%s", client.name, client.id, root))
	end

	table.insert(lines, "Filetype: " .. vim.bo[bufnr].filetype)
	table.insert(lines, "Buffer: " .. vim.api.nvim_buf_get_name(bufnr))

	vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO, { title = "LSPInfo" })
end, {})

start_managed_servers()
