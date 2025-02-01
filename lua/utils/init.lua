local M = {}

function M.print_script_path()
	local str = debug.getinfo(2, "S").source:sub(2)
	print("Loaded Lua Module: "..str)
end

return M
