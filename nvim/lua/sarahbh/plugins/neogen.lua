return {
  "danymat/neogen",
  ft = { "c", "cpp" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "L3MON4D3/LuaSnip",
  },
  opts = {
    snippet_engine = "luasnip",
  },
  config = function(_, opts)
    require("neogen").setup(opts)

    vim.keymap.set("n", "<leader>cd", function()
      require("neogen").generate()
    end, {
      desc = "Generate C++ documentation",
      buffer = true,
    })
  end,
}
