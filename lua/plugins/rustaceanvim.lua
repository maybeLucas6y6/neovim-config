local rustacean = {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    dependencies = "neovim/nvim-lspconfig",
}

vim.g.rustaceanvim = {
	server = {
		on_attach = function(client, bufnr)
			vim.keymap.set("n", "<leader>a", function()
				vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
				-- or vim.lsp.buf.codeAction() if you don't want grouping.
			end, { silent = true, buffer = bufnr })

			vim.keymap.set(
				"n",
				"<leader>cb",
				":! cargo build<CR>",
				{ noremap = true, buffer = bufnr, desc = "cargo build project" }
			)
		end,
	},
}

--[[ THIS IS HOW YOU OVERRIDE THE DEFAULT CONFIG
vim.g.rustaceanvim = {
    -- Plugin configuration
    tools = {
    },
    -- LSP configuration
    server = {
        on_attach = function(client, bufnr)
            -- you can also put keymaps in here
        end,
        default_settings = {
            -- rust-analyzer language server configuration
            ["rust-analyzer"] = {
            },
        },
    },
    -- DAP configuration
    dap = {
    },
}
]]--

return rustacean
