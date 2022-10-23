local M = {}
function M.open(kanban, task)
	task.buf_nr = vim.api.nvim_create_buf(false, "nomodeline")
	vim.api.nvim_buf_set_lines(task.buf_nr, 0, -1, true, { task.title })

	task.win_id = vim.api.nvim_open_win(task.buf_nr, true, task.buf_conf)
	kanban.fn.tasks.map(kanban, task)
	kanban.fn.tasks.resize(kanban, 0)
end
return M

