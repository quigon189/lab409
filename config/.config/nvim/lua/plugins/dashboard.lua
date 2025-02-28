local function default_header()
	return {
		"", "",
		"888          888          d8888   .d8888b.   .d8888b.  ",
		"888          888         d8P888  d88P  Y88b d88P  Y88b ",
		"888          888        d8P 888  888    888 888    888 ",
		"888  8888b.  88888b.   d8P  888  888    888 Y88b. d888 ",
		'888     "88b 888 "88b d88   888  888    888  "Y888P888 ',
		"888 .d888888 888  888 8888888888 888    888        888 ",
		"888 888  888 888 d88P       888  Y88b  d88P Y88b  d88P ",
		'888 "Y888888 88888P"        888   "Y8888P"   "Y8888P"  ',
		"", ""
	}
end

require('dashboard').setup {
	theme = 'doom',
	config = {
		header = default_header(),
		center = {
			{
				icon = '󰙅 ',
				icon_hl = 'Title',
				desc = '1.Файловый менеджер: ',
				desc_hl = 'String',
				key = 'm',
				--keymap = 'keymap -> <C-f>',
				key_format = ' [%s]',
				key_hl = 'Number',
				action = ':Neotree float'
			},
			{
				icon = '󰈞 ',
				icon_hl = 'Title',
				desc = '2.Найти файл: ',
				desc_hl = 'String',
				key = 'f',
				--keymap = 'SPC f f',
				key_hl = 'Number',
				action = ':Telescope find_files'
			},
			{
				icon = ' ',
				icon_hl = 'Title',
				desc = '3.Найти текст в файле: ',
				desc_hl = 'String',
				key = 'w',
				--keymap = 'SPC f w',
				key_hl = 'Number',
				action = ':Telescope live_grep'
			},
			{
				icon = '󰯙 ',
				icon_hl = 'Title',
				desc = '4.Mason - Менеджер LSP: ',
				desc_hl = 'String',
				key = 'l',
				--keymap = 'SPC f w',
				key_hl = 'Number',
				action = ':Mason'
			},
			{
				icon = '󰒲 ',
				icon_hl = 'Title',
				desc = '5.Lazy - Пакетный менеджер: ',
				desc_hl = 'String',
				key = 'p',
				--keymap = 'SPC f w',
				key_hl = 'Number',
				action = ':Lazy'
			},
		}
	}
}
