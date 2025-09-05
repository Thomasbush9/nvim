# 💤 My Neovim Config (LazyVim-based)

This is my personal Neovim 0.11+ configuration, built with ![lazy.vim](https://github.com/folke/lazy.nvim)
It's tuned for Python and Academic writing with a focus on clean UI and useful defaults.

## 📦 Features

- Plugin Manager ![Lazy.vim](https://github.com/folke/lazy.nvim)
- Colorscheme: ![gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim)
- File Explorer: ![nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
- Fuzzy finder: ![telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- Treesitter: ![nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- LSP: ![nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) + ![mason.nvim](https://github.com/williamboman/mason.nvim)
- Completion: ![nvim-cmp](https://github.com/hrsh7th/nvim-cmp) with LSP, buffer and path soruces
- Snippets: ![LuaSnip](https://github.com/L3MON4D3/LuaSnip) and ![friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
- Git: ![gisigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- ![papis.nvim](https://github.com/jghauser/papis.nvim)


## 🎨 Theme

Set in the init.lua:

```{lua}
require("gruvbox").setup({
  contrast = "hard",
  transparent_mode = false,
})
vim.o.background = "dark"
vim.cmd.colorscheme("gruvbox")
```

To change the theme, simply replace "gruvbox" with another installed colorscheme.

## 📂 File Explorer (nvim-tree)

Configured with modern on_attach

```{lua}
require("nvim-tree").setup({
  view = { width = 30, side = "left" },
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")
    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set("n", "v", api.node.open.vertical, { buffer = bufnr, desc = "Open: Vertical Split" })
    vim.keymap.set("n", "s", api.node.open.horizontal, { buffer = bufnr, desc = "Open: Horizontal Split" })
  end,
})
```

## 📖 Markdown + Citations

Start preview in browser:

```{nvim}
:MarkdownPreview
```

## Installation

Clone the directory:

```{bash}
git clone https://github.com/Thomasbush9/nvim
```

Install the plugins:

```{bash}
nvim + Lazy sync
```

Make sure you have:
- Neovim 0.11+
- Python host
- papis

## 🗝️ Key Features & Shortcuts

- <leader>e → Toggle file explorer (nvim-tree)
- <leader>ff → Telescope find files
- <leader>fg → Telescope live grep
- <leader>fb → Telescope buffers
- <leader>fh → Telescope help tags

**Other Important Keymaps:**

- <leader>y -> copy selected text
- <leader>gc -> comment in or out text
- <leader>fz -> fuzzy finder
