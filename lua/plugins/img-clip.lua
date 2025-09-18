return {
	{
	  "HakonHarnes/img-clip.nvim",
	  event = "VeryLazy",
	  opts = {
		default = {
		  dir_path = "/Users/kurokochikaito/Documents/imgs",
		  file_name = function()
			return os.date("%Y-%m-%d-%H-%M-%S")
		  end,
		  extension = "png",
		  use_absolute_path = true,
		  prompt_for_file_name = false,
		},
	  },
	  keys = {
		{ "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from clipboard" },
	  },
	}
}
