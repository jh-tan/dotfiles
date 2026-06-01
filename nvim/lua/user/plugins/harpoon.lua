return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	-- dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()
	end,
	keys = function()
		local function harpoon_list(action)
			return function()
				local list = require("harpoon"):list()
				list[action](list)
			end
		end

		local keys = {
			{ "<leader>hA", harpoon_list("prepend") },
			{ "<leader>ha", harpoon_list("add") },
			{
				"<leader>hl",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
			},
			{ "<leader>hq", harpoon_list("prev") },
			{ "<leader>he", harpoon_list("next") },
			{
				"<leader>hd",
				function()
					require("harpoon"):list():remove()
				end,
				desc = "Remove current file from Harpoon",
			},
		}

		local function select(index)
			return function()
				require("harpoon"):list():select(index)
			end
		end

		vim.list_extend(keys, {
			-- switch to harpooned file 1-8
			{ "<leader>h1", select(1) },
			{ "<leader>h2", select(2) },
			{ "<leader>h3", select(3) },
			{ "<leader>h4", select(4) },
			{ "<leader>h5", select(5) },
			{ "<leader>h6", select(6) },
			{ "<leader>h7", select(7) },
			{ "<leader>h8", select(8) },
		})

		local function replace(index)
			return function()
				require("harpoon"):list():replace_at(index)
			end
		end

		vim.list_extend(keys, {
			-- substitute harpooned file 1-8 with new files
			{ "<leader>hr1", replace(1) },
			{ "<leader>hr2", replace(2) },
			{ "<leader>hr3", replace(3) },
			{ "<leader>hr4", replace(4) },
			{ "<leader>hr5", replace(5) },
			{ "<leader>hr6", replace(6) },
			{ "<leader>hr7", replace(7) },
			{ "<leader>hr8", replace(8) },
		})

		return keys
	end,
}
