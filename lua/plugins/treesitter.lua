return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "lua", "c", "javascript", "java", "python" },
            highlight = { enable = true },
            autotag = { enable = true },               -- Auto close and auto rename HTML/XML tags
            autopairs = { enable = true },
            context_commentstring = { enable = true }, -- Use treesitter-based commentstrings
            matchup = { enable = true },               -- Match pairs of delimiters such as (), {}, []
            rainbow = { enable = true },
        })
    end
}

