local M = {}

function M.get_ops_laytout(options)
	if options.layout == nil then
		options.layout = {}
	end
	return {
		x_margin = options.layout.x_margin or 5,
		y_margin = options.layout.y_margin or 3,
		task_height = options.layout.task_height or 3,
	}
end

function M.get_ops_markdown(options)
	if options.markdown == nil then
		options.markdown = {}
	end
	return {
		list_head = options.markdown.list or "## ",
		title_head = options.markdown.title_head or "- [ ] ",
		title_style = options.markdown.title_style or "[[<title>]]",
		due_head = options.markdown.due_head or "@",
		due_style = options.markdown.due_style or "{<due>}",
		tag_head = options.markdown.tag_head or "#",
		tag_style = options.markdown.tag_style or "<tag>",
		header = options.markdown.header or {
			"---",
			"",
			"kanban-plugin: basic",
			"",
			"---",
		},
		footer = options.markdown.footer or {},
	}
end

function M.get_ops(options)
	local ops = {}
	ops.kanban_md_path = options.kanban_md_path or {
		"/Users/Kouiti/local_file/practice/kanban.nvim/template.md",
		"/Users/Kouiti/local_file/practice/kanban.nvim/template.md",
		"/Users/Kouiti/local_file/practice/kanban.nvim/template.md",
	}
	ops.layout = M.get_ops_laytout(options)
	ops.markdown = M.get_ops_markdown(options)
	-- ops.add_position = options.add_position or "bottom"
	ops.move_position = options.move_position or "top"
	ops.animation = options.animation or false
	return ops
end


return M
