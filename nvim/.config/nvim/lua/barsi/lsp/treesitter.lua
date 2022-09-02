require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  indent = { enable = true },

  highlight = {
    enable = true,
    --disable = { "" },
    additional_vim_regex_highlighting = false
  },

  rainbow = {
    enable = true,
    extended_mode = false
  },

  incremental_selection = { enable = true },
  textobjects = { enable = true }
}

require 'treesitter-context'.setup {
  enable = true,
  patterns = {
    default = {
      'class',
      'function',
      'method',
      'for',
      'while',
      'if',
      'switch',
      'case',
    },
  }
}
