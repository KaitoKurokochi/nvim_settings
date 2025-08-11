return {
	{
	  "HakonHarnes/img-clip.nvim",
	  event = "VeryLazy",
	  opts = {
		default = {
		  dir_path = os.getenv("HOME") .. "/Documents/imgs", 
		  file_name = function()
			return os.date("%Y-%m-%d-%H-%M-%S")
		  end,
		  extension = "png",
		  relative_to_current_file = false,
		  prompt_for_file_name = false,
		},
	  },
	  keys = {
		{ "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from clipboard" },
	  },
	}
}
