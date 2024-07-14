return {
    "saecki/crates.nvim",
    dependencies = {
        "hrsh7th/nvim-cmp",
    },
    tag = "stable",
    event = { "BufRead Cargo.toml" },
    ft = { "toml" },
    config = function()
        local crates  = require("crates")
        crates.setup()
        crates.show()
        vim.keymap.set("n", "rcu", function()
            require("crates").upgrade_all_crates()
        end)
        -- TODO: completion doesn't seem to work
    end,
}
