--vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = ","
vim.g.background = "light"

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.keymap.set('n', ' ', ':')

vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>P', '"+P')

vim.keymap.set('n', '<h', '^')
vim.keymap.set('n', '<l', '$')

vim.keymap.set('n', '<leader>gd', ':bdelete<CR>')
vim.keymap.set('n', 'gn', ':bnext<CR>')
vim.keymap.set('n', 'gp', ':bprevious<CR>')

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')


vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")

vim.cmd("set foldmethod=marker")

vim.cmd("au FileType markdown set autoindent expandtab tabstop=2 shiftwidth=2")

--vim.cmd("set term=xterm-256color")


vim.wo.number = true

