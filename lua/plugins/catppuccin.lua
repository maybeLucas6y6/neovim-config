return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            integrations = {
                barbar = true,
            },
        })

        vim.cmd.colorscheme("catppuccin-mocha")
    end,
}
