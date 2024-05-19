return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
    },
    config = function()
        require("mason-lspconfig").setup()
        require("mason-lspconfig").setup_handlers({
            function(server_name) -- default handler (optional)
                require("lspconfig")[server_name].setup({})
            end,
            -- ["rust_analyzer"] = function ()
                --     require("rust-tools").setup {}
                -- end
            })
        end,
    }
