local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "json",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.expandtab = true
    end,
})

vim.opt.rtp:prepend(lazypath)
require("options")
require("keymaps")
require("lazy").setup("plugins")
