local c_gdb_config = {
    name = "debug c",
    type = "gdb",
    request = "launch",
    program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
    args = function()
        local input = vim.fn.input("Arguments: ")
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

local cpp_gdb_config = {
    name = "debug cpp",
    type = "gdb",
    request = "launch",
    program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
    args = function()
        local input = vim.fn.input("Arguments: ")
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

local config = {
    c = {
        c_gdb_config,
    },
    cpp = {
        cpp_gdb_config,
    },
}

return config
