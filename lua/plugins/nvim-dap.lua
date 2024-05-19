return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "hrsh7th/nvim-cmp",
        "rcarriga/cmp-dap",
        "nvim-neotest/nvim-nio",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
        require("nvim-dap-virtual-text").setup()
        local dap, dapui = require("dap"), require("dapui")
        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "-i", "dap" }
        }

        require("cmp").setup({
            enabled = function()
                return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
                or require("cmp_dap").is_dap_buffer()
            end
        })
        require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
            sources = {
                { name = "dap" },
            },
        })

        local basic_gdb_configuration = {
            --name = "debug",
            type = "gdb",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopAtBeginningOfMainSubprogram = false,
            args = function()
                local input = vim.fn.input('Arguments: ')
                if input == "" then
                    return {}
                end
                return vim.split(input, " ")
            end,
            setupCommands = {
                {
                    text = "-enable-pretty-printing",
                    description =  "enable pretty printing",
                    ignoreFailures = false,
                },
            },
        }

        local c_gdb_config = basic_gdb_configuration
        c_gdb_config.name = "debug c"
        local cpp_gdb_config = basic_gdb_configuration
        cpp_gdb_config.name = "debug cpp"

        dap.configurations = {
            c = {
                c_gdb_config,
            },
            cpp = {
                cpp_gdb_config,
            },
        }

        dapui.setup()
        local open_dapui = function()
            vim.cmd.NvimTreeClose()
			dapui.open()
        end
        local close_dapui = function()
			dapui.close()
            vim.cmd.NvimTreeOpen()
        end
        dap.listeners.before.attach.dapui_config = open_dapui
		dap.listeners.before.launch.dapui_config = open_dapui
		dap.listeners.before.event_terminated.dapui_config = close_dapui
		dap.listeners.before.event_exited.dapui_config = close_dapui

        -- TODO: astea tb mutate
		vim.keymap.set("n", "<Leader>b", vim.cmd.DapToggleBreakpoint)
		vim.keymap.set("n", "<F1>", vim.cmd.DapContinue)
		vim.keymap.set("n", "<F2>", vim.cmd.DapStepInto)
		vim.keymap.set("n", "<F3>", vim.cmd.DapStepOver)
		vim.keymap.set("n", "<F4>", vim.cmd.DapStepOut)
		vim.keymap.set("n", "<F5>", vim.cmd.DapTerminate)
    end,
}
