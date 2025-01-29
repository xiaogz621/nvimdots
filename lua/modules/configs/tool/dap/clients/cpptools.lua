-- https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(via--cpptools)
return function()
	local dap = require("dap")
	local utils = require("modules.utils.dap")
	local is_windows = require("core.global").is_windows

	dap.adapters.cppdbg = {
		id = "cppdbg",
		type = "executable",
		command = "/home/xgz/download/t1/extension/debugAdapters/bin/OpenDebugAD7",
	}
	--	dap.adapters.cppdbg = {
	--		type = "server",
	--		port = "${port}",
	--		executable = {
	--			command = "/home/xgz/download/t1/extension/debugAdapters/bin/OpenDebugAD7", --vim.fn.exepath("codelldb"), -- Find codelldb on $PATH
	--			args = { "--port", "${port}" },
	--			detached = is_windows and false or true,
	--		},
	--	}
	dap.configurations.c = {
		{
			name = "Debug",
			type = "cppdbg",
			request = "launch",
			program = utils.input_exec_path(),
			cwd = "${workspaceFolder}",
			stopOnEntry = true,
			terminal = "integrated",
		},
		{
			name = "Debug (with args)",
			type = "cppdbg",
			request = "launch",
			program = utils.input_exec_path(),
			args = utils.input_args(),
			cwd = "${workspaceFolder}",
			stopOnEntry = true,
			terminal = "integrated",
		},
		{
			name = "Attach to a running process",
			type = "cppdbg",
			request = "attach",
			program = utils.input_exec_path(),
			stopOnEntry = false,
			waitFor = true,
		},
	}
	dap.configurations.cpp = dap.configurations.c
	dap.configurations.rust = dap.configurations.c
end
