return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.lsp.inlay_hint.enable(true, nil)
        vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#6c7086" })
    end,
}
