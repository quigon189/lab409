-- команды для установки шрифта
-- mkdir -p ~/.local/share/fonts
-- cd ~/.local/share/fonts
-- curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf
------------------------------------------
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
print("install_path: " .. install_path)
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	download_result = fn.system({'ls', '-l', install_path})
	print("download_result: " .. download_result)
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- ВНЕШНИЙ ВИД
	-- Информационная строка
	use "nvim-tree/nvim-web-devicons"
	use { 'nvim-lualine/lualine.nvim',
	requires = {'nvim-tree/nvim-web-devicons', opt = true},
	config = function()
		require('lualine').setup()
	end,
}
use({
	'rose-pine/neovim',
	as = 'rose-pine',
	config = function()
		vim.cmd('colorscheme rose-pine')
	end
})

-- МОДУЛИ РЕДАКТОРА
-- Табы с кладками
use {'akinsho/bufferline.nvim',
requires = 'nvim-tree/nvim-web-devicons',
config = function()
	require("bufferline").setup {}
end,
		}

		-- Файловй менеджер
		use { 'nvim-tree/nvim-tree.lua',
		requires = 'nvim-tree/nvim-web-devicons',
		config = function()
			require 'nvim-tree'.setup {}
		end,
	}

	-- popup windows
	use 'nvim-lua/popup.nvim'

	-- CODE
	-- автоматические закрывающиеся скобки
	use { 'windwp/nvim-autopairs',
	config = function()
		require("nvim-autopairs").setup()
	end }

	-- Коментарии для всех языков по нажатию gc
	use { 'numToStr/Comment.nvim',
	config = function()
		require('Comment').setup()
	end }

	-- LSP
	-- Конфигурации LSP клиента
	-- use {'neovim/nvim-lspconfig',
	-- config = function()
		--	require('lspconfig').gopls.setup({})
		-- end }
		-- use 'williamboman/nvim-lsp-installer'
		use 'neovim/nvim-lspconfig'
		use "williamboman/mason.nvim"
		-- иконки в выпадающем списке автодополнений (прямо как в vscode)
		use('onsails/lspkind-nvim')

		-- Автодополнение
		use 'hrsh7th/nvim-cmp'
		use 'hrsh7th/cmp-nvim-lsp'
		use 'hrsh7th/cmp-buffer'
		use 'saadparwaiz1/cmp_luasnip'

		-- Для файлов
		use 'hrsh7th/cmp-path'

		-- Snippets
		use 'L3MON4D3/LuaSnip'

		-- Treesitter
		use 'nvim-treesitter/nvim-treesitter'

		-- Линтер
		use 'dense-analysis/ale'

		-- Команды работают и на русской расскладке
		use 'powerman/vim-plugin-ruscmd'

		-- Автоформатирование
		use 'Chiel92/vim-autoformat'

		-- Переводчик
		use 'skanehira/translate.vim'

		if packer_bootstrap then
			require('packer').sync()
		end
	end)
