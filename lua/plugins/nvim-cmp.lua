return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        --"L3MON4D3/LuaSnip",
        --"saadparwaiz1/cmp_luasnip",
    },
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            window = {
                --completion = cmp.config.window.bordered(),
                --documentation = cmp.config.window.bordered(),
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                --{ name = "luasnip" },
            }, { name = "buffer" }),
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<C-e>"] = cmp.mapping.abort(),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        if #cmp.get_entries() == 1 then
                            cmp.confirm({ select = true })
                        else
                            cmp.select_next_item()
                        end
                    --elseif luasnip.can_expand_or_advance() then
                    --    luasnip.expand_or_advance()
                    elseif has_words_before() then
                        cmp.complete()
                        if #cmp.get_entries() == 1 then
                            cmp.confirm({ select = true })
                        end
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            cmp.event:on(
            "confirm_done",
            require("nvim-autopairs.completion.cmp").on_confirm_done()
            )
        })

        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local utf16capabilities = vim.lsp.protocol.make_client_capabilities()
        utf16capabilities.offsetEncoding = { "utf-16" }

        lspconfig.lua_ls.setup({ capabilities = capabilities })
        lspconfig.clangd.setup({ capabilities = utf16capabilities })
        lspconfig.rust_analyzer.setup({ capabilities = utf16capabilities })
        lspconfig.cmake.setup({ capabilities = utf16capabilities })

        vim.keymap.set("n", "K", vim.lsp.buf.hover)
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
    end,
}
