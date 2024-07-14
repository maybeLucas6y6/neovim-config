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
            sources = {
                {
                    name = "nvim_lsp",
                    entry_filter = function(entry, ctx)
                        return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
                    end
                },
                {
                    name = "crates",
                },
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<C-e>"] = cmp.mapping.abort(),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        if #cmp.get_entries() == 1 then
                            cmp.confirm({ select = true })
                        else
                            cmp.select_next_item()
                        end
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

        vim.keymap.set("n", "K", vim.lsp.buf.hover)
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
    end,
}
