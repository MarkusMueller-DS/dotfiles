return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Colorscheme
  use 'folke/tokyonight.nvim'
  vim.cmd[[colorscheme tokyonight-night]]

  -- treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- CMP
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- toggleterm
  use 'akinsho/toggleterm.nvim'

  -- devicons
  use 'kyazdani42/nvim-web-devicons'
end)
