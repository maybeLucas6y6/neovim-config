return {
    "tpope/vim-fugitive",
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git),
    vim.keymap.set("n", "<leader>gb", ":Git blame<CR>"), -- TODO: find this command
}
