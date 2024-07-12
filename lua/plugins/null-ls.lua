return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                --null_ls.builtins.diagnostics.eslint, --TODO: this line errors at healthcheck
                null_ls.builtins.completion.spell,

                --null_ls.builtins.completion.clangd,

                null_ls.builtins.code_actions.gitsigns
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, {})
    end,
}
