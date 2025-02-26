---------------------------------------------
-- Горячие клавиши
---------------------------------------------

local map =vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-- Выход из insert нажатием jk kj ii
map('i','jk','<Esc>', {noremap = true})
map('i','kj','<Esc>', {noremap = true})
map('i','ii','<Esc>', {noremap = true})

-- Автоформатирование + сохранение ctrl + s
map('i','<C-s>','<Esc>:Autoformat<CR>:w<CR>', default_opts)
map('n','<C-s>',':Autoformat<CR>:w<CR>', default_opts)

-- Переключение вкладок TAB Shift-TAB
map('n','<S-Tab>',':BufferLineCyclePrev<CR>', default_opts)
map('n','<Tab>',':BufferLineCycleNext<CR>', default_opts)

-- Листать страницы вверх / вниз Пробел / Ctrl + Пробел
map('n','<Space>',':<PageDown> zz', default_opts)
map('n','<C-Space>',':<PageUp> zz', default_opts)

-- Переводчик с Русского на Английский
map('v','t','<Plug>(VTranslate)', {})

-- Дерево файлов
map('n', 'F', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', default_opts)

