-- lua/plugins/open-browser.lua
return {
  {
    "tyru/open-browser.vim",
    keys = {
      { "gx", "<Plug>(openbrowser-smart-search)", mode = "n" },
      { "gx", "<Plug>(openbrowser-smart-search)", mode = "v" },
    },
    init = function()
      vim.g.openbrowser_default_search = "google"
    end,
  },
}
