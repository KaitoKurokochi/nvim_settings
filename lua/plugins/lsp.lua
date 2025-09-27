return {
    'neovim/nvim-lspconfig',
	event = { "BufReadPre", "BufNewFile" },
	config = function()
      vim.lsp.config("pyright", {})
      vim.lsp.enable({ "pyright" })
    end,
}
