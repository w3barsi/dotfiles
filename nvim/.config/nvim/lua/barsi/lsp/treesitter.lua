require('nvim-treesitter.configs').setup {
    ensure_installed = "all",
    indent = { enable = true },

    highlight = {
        enable = true,
        --disable = { "" },
        additional_vim_regex_highlighting = true
    },

    rainbow = {
        enable = true,
        extended_mode = false
    },

    incremental_selection = { enable = true },
    textobjects = { enable = true }
}
