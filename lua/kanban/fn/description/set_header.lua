local M = {}

local function write_title(task, insert)
  vim.fn.setline(1, "# " .. task.title)
end
local function write_tag(task, insert)
  local tags = ""
  for _, tag in pairs(task.tag) do
    tags = tags .. " " .. tag
  end
  vim.fn.setline(2, "tag:" .. tags)
end
local function write_due(task, insert)
  if #task.due == 0 then
    return
  end
  vim.fn.setline(3, "due: " .. task.due[1])
end
local function write_created(task, insert)
  vim.fn.setline(4, "created: " .. os.date("%Y/%m/%d"))
end
local function write_updated(task, insert)
  vim.fn.setline(5, "updated: " .. os.date("%Y/%m/%d"))
end

function M.set_header(kanban)
  local description = kanban.items.description
  local task = description.task

	local doc_lines = vim.fn.getbufline(kanban.items.description.buf_nr, 1, "$")

	if #doc_lines == 1 and doc_lines[1] == "" then
	  write_title(task, false)
	  write_tag(task, false)
	  write_due(task, false)
	  write_created(task, false)
	  write_updated(task, false)
	end
end

return M

