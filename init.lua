require('keymaps')
require('options')
require('plugins.keymaps')
-- init.lua (Neovim config file)
-- Set up the runtime path for lazy.nvim
vim.opt.rtp:prepend("~/.config/nvim/lazy/lazy.nvim")
-- Tell Lazy to use SSH instead of HTTPS for cloning plugins
vim.g.lazy_git_url_format = "git@github.com:%s.git"
-- Start lazy.nvim
require('lazy').setup({
	-- Add your plugins here, for example:
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },{
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
        mappings = {
          list = {
            { key = "v", action = "vsplit" },
            { key = "s", action = "split" },
          },
        },
      },
    })
  end,
}  ,
{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
{
  "numToStr/Comment.nvim",
  lazy = false,
  config = function()
    require("Comment").setup()
  end,
},
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
      diagnostics = {
        enabled = true,
        triggers = { "BufWritePost" },
      },
      completion = {
        enabled = true,
      },
    },
    codeRunner = {
      enabled = true,
      default_method = "slime", -- or "molten" if installed
      ft_runners = {},
      never_run = { "yaml" },
    },
  },
},
{'terrortylor/nvim-comment',
config = function()
	require("nvim_comment").setup({create_mappings = false})
end
},
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
    ft = { "markdown" }, -- Load only when a markdown file is opened
  },
  {
   'itchyny/calendar.vim',
   config = function()
      -- Optional: You can add key mappings or specific settings here
   end,
},
{
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  dependencies = {
    {'neovim/nvim-lspconfig'},             -- Required
    {
      'williamboman/mason.nvim',           -- Optional
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'L3MON4D3/LuaSnip'},         -- Required
  }
},
  {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = true
},

{
  'vim-pandoc/vim-pandoc',
  config = function()
    -- Additional configuration for pandoc if needed
  end
},
{
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
},
{
  'vim-pandoc/vim-pandoc-syntax',
  config = function()
    -- Syntax highlighting for academic writing
  end
},
{
  'MunifTanjim/nui.nvim', -- For UI components
},
{'kevinhwang91/pathlib.nvim', -- For file system path handling
},
{
  "jghauser/papis.nvim",
  dependencies = {
    "kkharji/sqlite.lua",   -- For database support
    "MunifTanjim/nui.nvim", -- For the UI components
    "pysan3/pathlib.nvim",  -- Path handling
    -- Optional if you're using telescope
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp"      -- For completion support (optional)
  },
  config = function()
    require("papis").setup({
      enable_keymaps = true, -- Enable default keymaps for the plugin
      cite_formats = {
        markdown = { ref_prefix = "@", separator_str = "; " },
        tex = { start_str = [[\cite{]], end_str = "}", separator_str = ", " },
      },
    })
  end,
},

-- Telescope extension for papis citation management
{
  'lervag/vimtex',
  config = function()
    vim.g.vimtex_view_method = 'zathura'  -- You can use your preferred PDF viewer
  end
},
{'luk400/vim-jukit'},

{
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup()
    end,
},

{
    'tpope/vim-fugitive',
},



})

vim.opt.termguicolors = true

-- Set up bufferline with default configuration
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "yaml" }, -- Add other languages you need as well
  highlight = {
    enable = true, -- Enable Treesitter-based syntax highlighting
  }
}
vim.g.python3_host_prog = "/Users/thomasbush/miniconda3/bin/python"

require("bufferline").setup({
    options = {
        numbers = "none", -- or "ordinal" | "buffer_id" | "both"
        close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
        indicator_icon = '▎',
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 18,
        diagnostics = false, -- Can be "nvim_lsp" to display LSP diagnostics
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = 'id' -- or 'extension' | 'relative_directory' | 'directory' | 'tabs'
    }
})
require('catppuccin').setup({
    flavour = "mocha", -- Can be "latte", "frappe", "macchiato", or "mocha"
    -- other options
})
vim.cmd.colorscheme("catppuccin")


-- You can customize your completion mappings here
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),   -- Navigate to the previous item
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),   -- Navigate to the next item
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),     -- Confirm completion with Ctrl + y
    ['<C-Space>'] = cmp.mapping.complete(),                -- Manually trigger completion with Ctrl + Space
    ['<CR>'] = cmp.mapping.confirm({ select = true }),      -- Confirm selection with Enter
  },
  sources = {
    { name = 'nvim_lsp' }, -- Use LSP as a completion source
    { name = 'buffer' },   -- Buffer completion
    { name = 'path' },     -- File path completion
    { name = 'luasnip' },  -- Snippet completion
  }
})

-- Ensure LSPs like pyright are installed
local lsp = require('lsp-zero')

lsp.preset('recommended')

-- This ensures Mason and Mason LSP Config are setup first
require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = { 'pyright', 'lua_ls' },
  handlers = {
    lsp.default_setup,
  },
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

lsp.setup()
require('lspconfig').pyright.setup({
  settings = {
    python = {
      pythonPath = vim.fn.systemlist("which python")[1],  -- auto-detects current env Python
    }
  }
})
-- Function to change conda environments

vim.api.nvim_exec([[
  function! SwitchCondaEnv(env)
    silent !conda activate a:env
    echo "Switched to Conda environment: " . a:env
  endfunction
]], false)

-- Map the command for quick usage
vim.api.nvim_set_keymap('n', '<leader>ce', ':call SwitchCondaEnv(input("Conda Env: "))<CR>', { noremap = true, silent = true })

require("toggleterm").setup{
  size = 20, -- Terminal size, adjust as needed
  open_mapping = [[<C-\>]], -- Default mapping, we will override this below
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  direction = "horizontal",
  close_on_exit = true,
  shell = vim.o.shell,
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "yaml", "lua", "markdown" }, -- Add more as needed
  highlight = {
    enable = true, -- Enable highlighting
  },
}



