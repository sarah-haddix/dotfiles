return {
  "szw/vim-maximizer",
  keys = { --tells nvim to lazy load this plugin whenever these keymaps are executed
    { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
  },
}
