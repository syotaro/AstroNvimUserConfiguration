return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      "bash",
      "css",
      "dockerfile",
      "go",
      "diff",
      "html",
      "hcl",
      "javascript",
      "json",
      "gitignore",
      "lua",
      "markdown",
      "markdown_inline",
      "scss",
      "tsx",
      "jsonc",
      "typescript",
      "graphql",
      "yaml",
      "toml",
      "fish",
      "ruby",
      "prisma",
      "php",
      "rust",
    })
  end,
}
