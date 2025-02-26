
-- Основные настройки
-------------------------------

local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g
local opt = vim.opt

-- Направление перевода
g.translate_source = 'ru'
g.translate_target = 'en'

-- Главные
opt.mouse = 'a'
opt.encoding = 'utf8'
opt.colorcolumn = '100'
opt.foldcolumn = '2'
opt.cursorline = true
opt.spelllang = { 'en_us', 'ru' }

opt.number = true
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true

opt.tabstop = 4
opt.shiftwidth = 4
-- 2 пробела Tab для опреденных типов файлов
cmd [[
autocmd FileType xml,html,xhtml,css,scss,javasript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]]

opt.smartindent = true

opt.so = 5
-- Убрать маркер длины строки у определенных типов
cmd [[
autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0
]]

-- Подсветка при коопировании
exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.higlight.on_yank{higroup="IncSearch", timeout=500}
augroup end
]], false)

----------------------------------------------
-- Настройка плагинов
----------------------------------------------
-- LSP settings
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
	local opts = {}
	if server.name == "sumneko_lua" then
		opts.settings = {
			Lua = {
				diagnostics = {
					globals = {'vim', 'use'},
				},
				workspace = {
					library= vim.api.nvim_get_runtime_file("", true),
				},
				telemetry = {
					enable = false,
				},
			},
		}
	end
	server:setup(opts)
end)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
vim.o.completeopt = 'menuone,noselect'
local luasnip = require 'luasnip'
local cmp = require 'cmp'
cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lap_expand(args.body)
		end,
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'path' },
		{ name = 'buffer', option = {
			get_bufnrs = function()
				return vim.api.nvim_list_bufs()
			end
		},
	},
},
}
