return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
        "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    config = function()
        require("barbar").setup()

        local opts = { noremap = true, silent = true } -- TODO: vezi ce s astea
        vim.keymap.set("n", "<A-,>", vim.cmd.BufferPrevious, opts)
        vim.keymap.set("n", "<A-.>", vim.cmd.BufferNext, opts)
        vim.keymap.set("n", "<A-<>", vim.cmd.BufferMovePrevious, opts)
        vim.keymap.set("n", "<A->>", vim.cmd.BufferMoveNext, opts)
        vim.keymap.set("n", "<A-p>", vim.cmd.BufferPin, opts)
        vim.keymap.set("n", "<A-c>", vim.cmd.BufferClose, opts)
    end,
    opts = {
        animation = false,
    },
}
