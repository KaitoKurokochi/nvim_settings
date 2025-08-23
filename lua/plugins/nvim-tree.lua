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
	      local ok_lib, lib = pcall(require, "nvim-tree.lib")
	      if not ok_lib or not lib then return end
		  local ok_node, node = pcall(lib.get_node_at_cursor)
		  if not ok_node or not node then return end

		  local path = node.absolute_path or node.link_to or node.name
		  local is_dir = (node.type == "directory") or (node.nodes ~= nil)
		  if path and not is_dir and path:lower():match("%.pdf$") then 
		    vim.notify("open pdf: " .. path)
			vim.fn.jobstart({ "open", path }, { detach = true }) 
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
