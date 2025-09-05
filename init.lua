require('keymaps')
require('options')
require('plugins.keymaps')

-- init.lua (Neovim config file)
-- Set up the runtime path for lazy.nvim
vim.opt.rtp:prepend("~/.config/nvim/lazy/lazy.nvim")

-- Tell Lazy to use SSH instead of HTTPS for cloning plugins
vim.g.lazy_git_url_format = "git@github.com-personal:%s.git"

-- ======================
-- PLUGINS
-- ======================
require('lazy').setup({

  -- === UI / Appearance ===
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      contrast = "hard",   -- "hard", "medium", or "soft"
      transparent_mode = false,
    })
    vim.o.background = "dark"         -- or "light"
    vim.cmd.colorscheme("gruvbox")
  end,
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
    require("nvim-tree").setup({
    view = {
      width = 30,
      side = "left",
    },
    on_attach = function(bufnr)
      local api = require("nvim-tree.api")

      -- Default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- Custom mappings
      vim.keymap.set("n", "v", api.node.open.vertical, { buffer = bufnr, desc = "Open: Vertical Split" })
      vim.keymap.set("n", "s", api.node.open.horizontal, { buffer = bufnr, desc = "Open: Horizontal Split" })
    end,
})

    end,
  },

  -- === Syntax & Treesitter ===
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  -- === LSP & Autocompletion ===
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      {
        'williamboman/mason.nvim',
        build = function() pcall(vim.cmd, 'MasonUpdate') end,
      },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  },

  -- === Navigation / Search ===
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- === Writing / Markdown / Academic ===
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
      "neovim/nvim-lspconfig",
      "hrsh7th/nvim-cmp",
    },
    opts = {
      debug = false,
      closePreviewOnExit = true,
      lspFeatures = {
        enabled = true,
        languages = { "r", "python", "julia", "bash", "html" },
        chunks = "curly",
        diagnostics = { enabled = true, triggers = { "BufWritePost" } },
        completion = { enabled = true },
      },
      codeRunner = {
        enabled = true,
        default_method = "slime",
        ft_runners = {},
        never_run = { "yaml" },
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
    ft = { "markdown" },
  },
  { 'vim-pandoc/vim-pandoc' },
  { 'vim-pandoc/vim-pandoc-syntax' },
  {
    "jghauser/papis.nvim",
    dependencies = {
      "kkharji/sqlite.lua",
      "MunifTanjim/nui.nvim",
      "pysan3/pathlib.nvim",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp"
    },
    config = function()
      require("papis").setup({
        enable_keymaps = true,
        cite_formats = {
          markdown = { ref_prefix = "@", separator_str = "; " },
          tex = { start_str = [[\cite{]], end_str = "}", separator_str = ", " },
        },
      })
    end,
  },
  {
    'lervag/vimtex',
    config = function()
      vim.g.vimtex_view_method = 'zathura'
    end
  },
  { 'luk400/vim-jukit' },

  -- === Git ===
  {
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup() end,
  },
  { 'tpope/vim-fugitive' },

  -- === Utilities ===
  { "nvim-neotest/nvim-nio", lazy = false },
  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function() require("Comment").setup() end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  { 'MunifTanjim/nui.nvim' },
  { 'itchyny/calendar.vim' },
})

-- ======================
-- SETTINGS
-- ======================
vim.opt.termguicolors = true
vim.g.python3_host_prog = "/Users/thomasbush/miniconda3/bin/python"

-- === Treesitter ===
require('nvim-treesitter.configs').setup {
  ensure_installed = { "yaml", "lua", "markdown" },
  highlight = { enable = true }
}

-- === Bufferline ===
require("bufferline").setup({
  options = {
    numbers = "none",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    diagnostics = false,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    always_show_bufferline = true,
    sort_by = 'id'
  }
})

-- === Colorscheme ===
require('catppuccin').setup({
  flavour = "frappe", -- Options: "latte", "frappe", "macchiato", "mocha"
})
vim.o.background = "dark"
vim.cmd.colorscheme "gruvbox"
-- === Completion ===
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' },
  }
})

-- === LSP ===
local lsp = require('lsp-zero')
lsp.preset('recommended')

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'pyright', 'lua_ls' },
  handlers = { lsp.default_setup },
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

lsp.setup()

require('lspconfig').pyright.setup({
  settings = {
    python = {
      pythonPath = vim.fn.systemlist("which python")[1],
    }
  }
})

-- === Conda Switching ===
vim.api.nvim_exec([[
  function! SwitchCondaEnv(env)
    silent !conda activate a:env
    echo "Switched to Conda environment: " . a:env
  endfunction
]], false)

vim.api.nvim_set_keymap(
  'n',
  '<leader>ce',
  ':call SwitchCondaEnv(input("Conda Env: "))<CR>',
  { noremap = true, silent = true }
)

-- === ToggleTerm ===
require("toggleterm").setup({
  size = 20,
  open_mapping = [[<C-\>]],
  hide_numbers = true,
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  direction = "horizontal",
  close_on_exit = true,
  shell = vim.o.shell,
})

