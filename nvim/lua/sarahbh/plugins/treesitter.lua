-- better syntax highlighting, indentation, autotagging, incremental selection
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main", -- the rewrite; master is frozen
  lazy = false, -- main branch does not support lazy-loading
  build = ":TSUpdate",
  dependencies = {
    "mason-org/mason.nvim", -- provides the tree-sitter CLI (see mason.lua)
    { "windwp/nvim-ts-autotag", config = true },
  },
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter")

    treesitter.setup({})

    -- ensure these language parsers are installed
    treesitter.install({
      "json",
      "javascript",
      "typescript",
      "yaml",
      "html",
      "css",
      "markdown",
      "markdown_inline",
      "svelte",
      "graphql",
      "bash",
      "lua",
      "vim",
      "dockerfile",
      "gitignore",
      "query",
      "vimdoc",
      "c",
      "cpp",
      "python",
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("UserTreesitter", {}),
      callback = function(ev)

        -- enable syntax highlighting (silently skipped if no parser exists)
        if not pcall(vim.treesitter.start, ev.buf) then
          return
        end
        -- enable indentation
        vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
