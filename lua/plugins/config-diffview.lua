return {
  "sindrets/diffview.nvim",
  config = function ()
    require("diffview").setup()
  end,
  lazy = false,
  keys = {
    {mode = "n", "<leader>hh", "<cmd>DiffviewOpen HEAD~1<CR>", desc = "diff between previous one"},
    {mode = "n", "<leader>hf", "<cmd>DiffviewFileHistory %<CR>", desc = "history of file modification"},
    {mode = "n", "<leader>hc", "<cmd>DiffviewClose<CR>", desc = "close diff window"},
    {mode = "n", "<leader>hd", "<cmd>Diffview<CR>", desc = "open conflict solution window"},
  },
}
