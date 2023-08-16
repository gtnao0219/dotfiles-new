local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'neoclide/coc.nvim',
    branch = "release"
  }
  use 'lambdalisue/fern.vim'
  use 'kana/vim-textobj-user'
  use 'kana/vim-operator-user'
  use 'kana/vim-operator-replace'
  use 'sainnhe/gruvbox-material'

  if packer_bootstrap then
    require('packer').sync()
  end
end)


vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true


vim.g.mapleader = " "
vim.keymap.set('n', '<Leader>', '<Nop>')
vim.keymap.set('x', '<Leader>', '<Nop>')

vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')
vim.keymap.set('x', ';', ':')
vim.keymap.set('x', ':', ';')

vim.keymap.set('n', '<Leader>h', '^')
vim.keymap.set('n', '<Leader>l', '$')

vim.keymap.set('n', '<Leader>w', [[<Cmd>update<CR>]])
vim.keymap.set('n', '<Leader>q', [[<Cmd>quit<CR>]])


vim.g.coc_global_extensions = {
  'coc-clangd',
  'coc-docker',
  'coc-lua',
  'coc-tsserver',
  'coc-yaml',
}
vim.keymap.set('i', '<CR>', [[pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
  { silent = true, expr = true })
vim.keymap.set('n', '<Leader>df', [[<Plug>(coc-definition)]], { silent = true, noremap = false })
vim.keymap.set('n', '<Leader>rf', [[<Plug>(coc-references)]], { silent = true, noremap = false })
vim.keymap.set('n', '<Leader>fm', [[<Plug>(coc-format)]], { silent = true, noremap = false })
vim.keymap.set('n', '<Leader>dp', [[<Plug>(coc-diagnostic-prev)]], { silent = true, noremap = false })
vim.keymap.set('n', '<Leader>dn', [[<Plug>(coc-diagnostic-next)]], { silent = true, noremap = false })

vim.keymap.set('n', '<C-n>', [[<Cmd>Fern . -reveal=% -drawer -toggle<CR>]])

vim.keymap.set('n', '_', [[<Plug>(operator-replace)]], { noremap = false })
vim.keymap.set('x', '_', [[<Plug>(operator-replace)]], { noremap = false })


vim.api.nvim_create_augroup('indent', {})
vim.api.nvim_create_autocmd('FileType', {
  group = 'indent',
  pattern = 'cpp',
  command = 'setlocal noexpandtab shiftwidth=4 softtabstop=4 tabstop=4',
})


pcall(vim.cmd, [[colorscheme gruvbox-material]])

