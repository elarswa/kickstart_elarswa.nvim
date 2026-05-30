# nvim config

## Structure

```
~/.config/nvim/
├── init.lua                    # Entry point — bootstraps lazy.nvim, loads remaps, sets, plugins
├── lua/
│   ├── remaps/init.lua         # All keymaps (leader key, navigation, etc.)
│   ├── sets/init.lua           # vim.opt settings (tabs, line numbers, clipboard, etc.)
│   ├── utils/init.lua          # Shared utility functions
│   └── plugins/
│       └── init.lua            # Plugin declarations (add/remove plugins here)
└── after/plugin/               # Per-plugin config, loaded after plugins initialize
    ├── lspconfig.lua           # LSP setup, Mason, nvim-cmp completion
    ├── telescope.lua           # Telescope keymaps and config
    ├── harpoon.lua             # Harpoon keymaps
    ├── colors.lua              # Colorscheme (onedark_vivid)
    ├── gitsigns.lua            # Git gutter signs
    ├── vim-fugitive.lua        # Git keymaps
    ├── which-key.lua           # Which-key config
    ├── lualine.lua             # Status line config
    ├── nvim-surround.lua       # Surround text objects config
    └── nvim-web-devicons.lua   # File icons config
```

## Package manager: Lazy

Plugins are declared in `lua/plugins/init.lua`. Lazy auto-installs on first launch.

| Task | Command |
|---|---|
| Open Lazy UI | `:Lazy` |
| Install missing plugins | `:Lazy install` |
| Update all plugins | `:Lazy update` |
| Clean unused plugins | `:Lazy clean` |
| Sync (install + update + clean) | `:Lazy sync` |

After editing `lua/plugins/init.lua`, run `:Lazy sync`.

## LSP / Language servers: Mason

Mason manages language server installations separately from plugins.

| Task | Command |
|---|---|
| Open Mason UI | `:Mason` |
| Install a server | `:MasonInstall <name>` (e.g. `pyright`, `lua_ls`) |
| Update installed servers | `:MasonUpdate` |

Installed servers are auto-configured via `mason-lspconfig` in `after/plugin/lspconfig.lua`. `sourcekit` (Swift/Obj-C) is enabled directly via `vim.lsp.enable`.

## Common things to change

**Indentation / tabs** — `lua/sets/init.lua`
```lua
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true  -- false = hard tabs
```

**Colorscheme** — `after/plugin/colors.lua`
```lua
color = color or "onedark_vivid"  -- change this string
```
Available variants (onedarkpro): `onedark`, `onedark_vivid`, `onelight`, `onedark_dark`

**Keymaps** — `lua/remaps/init.lua` for general maps, `after/plugin/<name>.lua` for plugin-specific maps

**Color column / line width marker** — `lua/sets/init.lua`
```lua
vim.opt.colorcolumn = "80"
```

**Scroll offset** — `lua/sets/init.lua`
```lua
vim.opt.scrolloff = 8  -- lines kept above/below cursor
```

## Key mappings reference

Leader key is `<Space>`.

### General

| Key | Action |
|---|---|
| `<leader>e` | Open netrw explorer |
| `<leader>f` | Format file (LSP) |
| `H` / `L` | Jump to start / end of line (normal + visual) |
| `J` / `K` (visual) | Move selection up/down |
| `<Esc>` | Clear search highlights |
| `<Esc><Esc>` (terminal) | Exit terminal mode |

### Telescope

| Key | Action |
|---|---|
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep |
| `<leader>sd` | Diagnostics |
| `<leader>sh` | Help tags |
| `<leader>sk` | Keymaps |
| `<leader>ss` | Select Telescope picker |
| `<leader>sw` | Search current word |
| `<leader>sr` | Resume last search |
| `<leader>s.` | Recent files |
| `<leader><leader>` | Open buffers |
| `<leader>/` | Fuzzy search in current buffer |

### Harpoon

| Key | Action |
|---|---|
| `<leader>a` | Add file |
| `<C-e>` | Toggle quick menu |
| `<C-h/j/k/l>` | Jump to file 1–4 |

### LSP (active when a language server attaches)

| Key | Action |
|---|---|
| `K` | Hover docs |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `go` | Go to type definition |
| `gr` | References |
| `<F2>` | Rename |
| `<F3>` | Format (async) |
| `<F4>` | Code action |

### Git

| Key | Action |
|---|---|
| `<leader>gs` | Git status (Fugitive) |

## Updating everything at once

1. `:Lazy sync` — update plugins
2. `:MasonUpdate` — update language servers
3. `:TSUpdate` — update Treesitter parsers (if installed)
