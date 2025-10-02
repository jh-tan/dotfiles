return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				python = { "ruff_format", "ruff_organize_imports" },
				-- python = { "black", "isort" },  -- Alternative
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				go = { "gofmt", "goimports" },
				sh = { "shfmt" },
				c = { "clang_format" },
				cpp = { "clang_format" },
			},

			-- Format on save
			format_on_save = function(bufnr)
				-- Disable with global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return {
					timeout_ms = 500,
					lsp_format = "fallback", -- Use LSP formatting if no formatter available
				}
			end,
		})

		-- Manual format keymap
		vim.keymap.set({ "n", "v" }, "<Leader>i", function()
			conform.format({
				async = false,
				timeout_ms = 500,
				lsp_format = "fallback", -- Use LSP formatting if no formatter available
			})
		end, { desc = "Format buffer or range" })
	end,
}
