return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_compiler_method = "latexmk"
        -- Disable VimTeX's own completion to avoid conflicts
        vim.g.vimtex_complete_enabled = 0
	end,
	config = function()
		-- VimTeX configuration goes here:
		vim.keymap.set(
			"n",
			"<LocalLeader>g",
			":echo synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>",
			{ silent = false }
		)
		local function set_tex_highlights()
			vim.api.nvim_set_hl(0, "texCmd", { bold = false, italic = false })
			vim.api.nvim_set_hl(0, "texMathEnvArgName", { link = "texEnvArgName" })
			vim.api.nvim_set_hl(0, "texMathZone", { link = "LocalIdent" })
			vim.api.nvim_set_hl(0, "texMathZoneEnv", { link = "texMathZone" })
			vim.api.nvim_set_hl(0, "texMathZoneEnvStarred", { link = "texMathZone" })
			vim.api.nvim_set_hl(0, "texMathZoneX", { link = "texMathZone" })
			vim.api.nvim_set_hl(0, "texMathZoneXX", { link = "texMathZone" })
			vim.api.nvim_set_hl(0, "texMathZoneEnsured", { link = "texMathZone" })

			-- Small tweaks
			vim.api.nvim_set_hl(0, "QuickFixLine", { link = "Normal" })
			vim.api.nvim_set_hl(0, "qfLineNr", { link = "Normal" })
			vim.api.nvim_set_hl(0, "EndOfBuffer", { link = "LineNr" })
			vim.api.nvim_set_hl(0, "Conceal", { link = "LocalIdent" })
		end

		-- Apply only in LaTeX files
		vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
			pattern = "tex",
		 	callback = set_tex_highlights,
		 })
	end,
}
