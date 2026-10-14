-- install language servers that we need to enable lsp functionality for the languages i work in 
return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig", -- must be on the runtimepath before mason-lspconfig is set up (v2 requirement)
    "WhoIsSethDaniel/mason-tool-installer.nvim", -- makes it possible to install further non-lsp tools through mason - i use this so that I'm able to install tree-sitter-cli through mason in an os-agnostic way
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "clangd",
        "lua_ls",
      },
      
      -- call vim.lsp.enable() on every installed server
      automatic_enable = true,
    })

    -- install tools (not language servers) so a fresh machine needs no manual installs 
    require("mason-tool-installer").setup({
      ensure_installed = {
        "tree-sitter-cli", -- needed by nvim-treesitter (main branch) to compile parsers
      },
    })
  end,
}
