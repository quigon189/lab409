require 'nvim-treesitter.config'.setup {
	ensure_installed = { "lua", "python", "javascript", "html", "go" },

	sync_install = false,
        
	auto_install = true,

	highlight = {
		enable = true,

		additional_vim_regex_highlighting = false,
	},
}
