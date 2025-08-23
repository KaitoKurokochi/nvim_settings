return {
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file tree" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
	  local api = require("nvim-tree.api")
	  local function my_on_attach(bufnr) 
	    api.config.mappings.default_on_attach(bufnr) 
	    pcall(vim.keymap.del, "n", "o", { buffer = bufnr }) 
		local function open_or_open_pdf() 
		  local node = require("nvim-tree.api").tree.get_node_under_cursor()
		  local path = node.absolute_path
		  if path:lower():match("%.pdf$") then 
			vim.fn.jobstart({ "open", "-a", "Preview", path }, { detach = true }) 
		  else 
		    api.node.open.edit() 
		  end 
	    end
	    
	    vim.keymap.set("n", "o", open_or_open_pdf, {
		  buffer = bufnr, noremap = true, silent = true, nowait = true, 
		  desc = "nvim-tree: open or Preview PDF", 
		})
	  end 

      require("nvim-tree").setup({
        filters = {
          dotfiles = false,
          git_ignored = false,
        },
	    on_attach = my_on_attach, 
      })
    end,
  },
}
