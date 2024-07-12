return {
    "kdheepak/lazygit.nvim",
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies =  {
        "nvim-telescope/telescope.nvim",
    },
    keys = {
        { "<leader>g", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    },
    config = function()
        require("telescope").load_extension("lazygit")
    end,
}