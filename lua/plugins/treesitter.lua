-- Treesitter: syntax highlighting and smart indent
-- LaTeX/Markdown disabled to avoid VimTeX/highlight conflicts

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "lua", "vim", "vimdoc", "query", "html", "python" },
			--auto_install = true,
			highlight = {
				enable = true,
				disable = { "latex", "markdown" },
			},
			indent = { enable = true },
		})
	end,
}
