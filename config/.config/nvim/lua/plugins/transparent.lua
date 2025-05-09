require("transparent").setup({
  exclude_groups = {
		'CursorLine'
	},
})
vim.g.transparent_groups = vim.list_extend(
  vim.g.transparent_groups or {},
  vim.tbl_map(function(v)
    return v.hl_group
  end, vim.tbl_values(require('bufferline.config').highlights))
)
require('transparent').clear_prefix('BufferLine')
