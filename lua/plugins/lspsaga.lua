return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("lspsaga").setup({
      ui = {
        border = "single",
      },
      symbol_in_winbar = {
        enable = true,
      },
      lightbulb = {
        enable = true,
      },
      outline = {
        win_width = 50,
        auto_preview = false,
      },
    })

    local keymap = vim.keymap.set
    keymap("n", "K",  "<cmd>Lspsaga hover_doc<CR>")
    keymap("n", "gr", "<cmd>Lspsaga finder<CR>")
    keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
    keymap("n", "gD", "<cmd>Lspsaga goto_definition<CR>")
    keymap("n", "ga", "<cmd>Lspsaga code_action<CR>")
    keymap("n", "gn", "<cmd>Lspsaga rename<CR>")
    keymap("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>")
    keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
    keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
    keymap("n", "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
    keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga term_toggle<CR>]])
  end
}

