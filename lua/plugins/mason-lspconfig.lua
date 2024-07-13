return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local utf16capabilities = vim.lsp.protocol.make_client_capabilities()
        utf16capabilities.offsetEncoding = { "utf-16" }

        require("mason-lspconfig").setup()
        require("mason-lspconfig").setup_handlers({
            function (server_name)
                lspconfig[server_name].setup({})
            end,
            ["rust_analyzer"] = function() end, -- for rustaceanvim
            ["clangd"] = function()
                lspconfig.clangd.setup({ capabilities = utf16capabilities })
            end,
        })
    end,
}
