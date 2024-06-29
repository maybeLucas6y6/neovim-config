return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup({
            disable_netrw = true,
            hijack_netrw = true,
            hijack_cursor = true,
            hijack_unnamed_buffer_when_opening = false,
            sync_root_with_cwd = true,
            update_focused_file = {
                enable = true,
                update_root = false,
            },
            view = {
                adaptive_size = true,
                side = "left",
                preserve_window_proportions = true,
                cursorline = true,
                width = {
                    max = 64,
                    padding = 2,
                }
            },
            git = {
                enable = true,
                ignore = false,
            },
            filesystem_watchers = {
                enable = true,
            },
            actions = {
                open_file = {
                    resize_window = true,
                },
            },
            renderer = {
                --{ "none", "icon", "name", "all" }
                highlight_git = "icon",
                --highlight_opened_files = "all",
                highlight_modified = "all",
                --highlight_bookmarks = "all",
                highlight_diagnostics = "all",
                highlight_clipboard = "name",

                root_folder_label = false,

                indent_markers = {
                    enable = true,
                },

                --[[
                icons = {
                    git_placement = { "before", "after", "signcolumn" },
                    modified_placement = { "before", "after", "signcolumn" },
                    diagnostics_placement = { "before", "after", "signcolumn" },
                    bookmarks_placement = { "before", "after", "signcolumn" },
                },
                ]]--
                icons = {
                    git_placement = "after",
                    modified_placement = "before",
                    diagnostics_placement = "signcolumn",
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                    },

                    glyphs = {
                        default = "󰈚",
                        symlink = "",
                        folder = {
                            default = "",
                            empty = "",
                            empty_open = "",
                            open = "",
                            symlink = "",
                            symlink_open = "",
                            arrow_open = "",
                            arrow_closed = "",
                        },
                        git = {
                            unstaged = "✗",
                            staged = "✓",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "★",
                            deleted = "",
                            ignored = "◌",
                        },
                    },
                },
            },
        })

        vim.keymap.set("n", "<C-n>", vim.cmd.NvimTreeToggle)
        vim.keymap.set("n", "<Leader>e", vim.cmd.NvimTreeFocus)
    end,
}
