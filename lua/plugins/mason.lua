return {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {
            -- rust
            "rust-analyzer",
            "codelldb",

            -- c/cpp
            "clangd",
            "cmake-language-server",

            -- lua
            "lua-language-server",
            "stylua",

            -- python
            "pyright",

            -- bash
            "bash-language-server",
        },
    },
    config = function()
        require("mason").setup()
    end,
}
