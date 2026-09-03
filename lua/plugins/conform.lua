return {
  "stevearc/conform.nvim",
  ft = { "markdown" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        markdown = { "prettier" },
      },
      format_on_save = {
        timeout_ms = 500,
      },
    })
  end,
}
