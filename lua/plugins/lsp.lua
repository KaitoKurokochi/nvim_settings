return {
	{
	  "neovim/nvim-lspconfig",
	  event = { "BufReadPre", "BufNewFile" },
	  config = function()
		require("lspconfig").pyright.setup{
		  venvPath = ".",
		  venv = "venv",
		}
	  end,
	}
}
