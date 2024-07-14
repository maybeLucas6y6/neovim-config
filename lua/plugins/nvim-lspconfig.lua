return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.lsp.inlay_hint.enable(true, nil)
    end,
}
