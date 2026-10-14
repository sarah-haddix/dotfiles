-- install language servers that we need to enable lsp functionality for the languages i work in 
return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig", -- must be on the runtimepath before mason-lspconfig is set up (v2 requirement)
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
        "clangd"
      },
      
      -- call vim.lsp.enable() on every installed server
      automatic_enable = true,
    })
  end,
}
