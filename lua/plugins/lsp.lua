return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts = opts or {}
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "pyright",
        "css-lsp",
        "html-lsp",
        "omnisharp",
        "csharpier",
        "netcoredbg",
      })
      return opts
    end,
  },
  { "williamboman/mason-lspconfig.nvim" },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.lsp.config("pyright", {})
      vim.lsp.config("cssls", { cmd = { "vscode-css-language-server", "--stdio" } })
      vim.lsp.config("html", {})
      vim.lsp.config("omnisharp", {})

      vim.lsp.enable({ "pyright", "cssls", "html", "omnisharp" })
    end,
  },
}
