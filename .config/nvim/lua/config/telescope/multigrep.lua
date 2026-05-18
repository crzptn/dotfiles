local M = {}

local function command_generator(prompt)
	if not prompt or prompt == "" then
		return nil
	end

	local pieces = vim.split(prompt, "  ")
	local args = {}

	if pieces[1] ~= nil then
		table.insert(args, "-e")
		table.insert(args, pieces[1])
	end

	if pieces[2] ~= nil then
		table.insert(args, "-g")
		table.insert(args, pieces[2])
	end

	return vim.iter({
		"rg",
		"--color=never",
		"--no-heading",
		"--with-filename",
		"--line-number",
		"--column",
		"--smart-case",
		args,
	}):flatten():totable()
end

function M.live_multigrep(opts)
	opts = opts or {}

	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local make_entry = require("telescope.make_entry")
	local conf = require("telescope.config").values

	pickers.new(opts, {
		debounce = 100,
		prompt_title = "Live Multigrep",
		finder = finders.new_async_job({
			command_generator = command_generator,
			cwd = opts.cwd,
			entry_maker = make_entry.gen_from_vimgrep(opts),
		}),
		previewer = conf.grep_previewer(opts),
		sorter = require("telescope.sorters").empty(),
	}):find()
end

function M.setup() end

return M
