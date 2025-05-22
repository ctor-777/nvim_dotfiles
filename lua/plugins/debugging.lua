return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
		"jay-babu/mason-nvim-dap.nvim",
		{
			"rcarriga/nvim-dap-ui",
			dependencies = {
				"nvim-neotest/nvim-nio"
			}
		},

	},
	config = function()
		require("dapui").setup()
		require("dap-go").setup()
		--require("dap.ext.vscode").load_launchjs(nil, {})

		require("mason-nvim-dap").setup({
			automatic_setup = true,
		})

		local dap, dapui = require("dap"), require("dapui")

		dap.adapters.codelldb = {
		  type = 'server',
		  port = "${port}",
		  executable = {
			-- CHANGE THIS to your path!
			command = '/Users/ctor/.local/share/nvim/mason/bin/codelldb',
			args = {"--port", "${port}"},

			-- On windows you may have to uncomment this:
			-- detached = false,
		  }
		}

		dap.configurations.cpp = {
			{
				name = "lldb",
				type = "codelldb",
				request = "launch",
				-- program = vim.fn.getcwd() .. '/userprocs',
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}',
				-- externalTerminal = false,
				stopOnEntry = false,
				-- args = {
				-- 	"ctor"
				-- },
				args = function()
					local inputstr = vim.fn.input('args: ')
					local sep = "%s"
					local t={}
					for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
						table.insert(t, str)
					end
					return t
				end,
				stdio = {}
			},
		}

		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp
		dap.configurations.java = {
			{
				type = 'java',
				request = 'launch',
				name = 'Launch Java Program',
				mainClass = 'scrabble.Main', -- Replace with your main class
				projectName = 'your-project-name', -- Replace with your project name
				javaExec = '', -- Path to your Java executable
			},
		}


dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
		vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
		vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
		vim.keymap.set("n", "<C-o>", ":DapStepOver<CR>")
		vim.keymap.set("n", "<Leader>dO", ":DapStepOut<CR>")
		vim.keymap.set("n", "<Leader>di", ":DapStepIn<CR>")
	end,
}
