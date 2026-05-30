# nvim config

## Structure

```
~/.config/nvim/
├── init.lua                    # Entry point — loads remaps, sets, plugins
├── lua/
│   ├── remaps/init.lua         # All keymaps (leader key, navigation, etc.)
│   ├── sets/init.lua           # vim.opt settings (tabs, line numbers, clipboard, etc.)
│   └── plugins/
│       └── packer.lua          # Plugin declarations (add/remove plugins here)
└── after/plugin/               # Per-plugin config, loaded after plugins initialize
    ├── lspconfig.lua           # LSP setup, Mason, nvim-cmp completion
    ├── telescope.lua           # Telescope keymaps and config
    ├── harpoon.lua             # Harpoon keymaps
    ├── neo-tree.lua            # File tree config
    ├── colors.lua              # Colorscheme (onedark_vivid)
    ├── gitsigns.lua            # Git gutter signs
    ├── vim-fugitive.lua        # Git keymaps
    ├── which-key.lua           # Which-key config
    └── treesitter.lua          # Treesitter parsers config
```

## Package manager: Packer

Plugins are declared in `lua/plugins/packer.lua`.

| Task | Command |
|---|---|
| Install missing plugins | `:PackerInstall` |
| Update all plugins | `:PackerUpdate` |
| Remove unused plugins | `:PackerClean` |
| Sync (install + update + clean) | `:PackerSync` |

After editing `packer.lua`, run `:PackerSync`.

## LSP / Language servers: Mason

Mason manages language server installations separately from plugins.

| Task | Command |
|---|---|
| Open Mason UI | `:Mason` |
| Install a server | `:MasonInstall <name>` (e.g. `pyright`, `lua_ls`) |
| Update installed servers | `:MasonUpdate` |

Installed servers are auto-configured via `mason-lspconfig` in `after/plugin/lspconfig.lua`.

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

| Key | Action |
|---|---|
| `<leader>e` | Open netrw explorer |
| `<leader>f` | Format file (LSP) |
| `<leader>gs` | Git status (Fugitive) |
| `<leader>a` | Harpoon: add file |
| `<C-e>` | Harpoon: quick menu |
| `<C-h/j/k/l>` | Harpoon: jump to file 1–4 |
| `<leader>sf` | Telescope: find files |
| `<leader>sg` | Telescope: live grep |
| `<leader>sd` | Telescope: diagnostics |
| `<leader>s.` | Telescope: recent files |
| `<leader><leader>` | Telescope: open buffers |
| `K` | LSP: hover docs |
| `gd` | LSP: go to definition |
| `gr` | LSP: references |
| `gi` | LSP: implementation |
| `<F2>` | LSP: rename |
| `<F4>` | LSP: code action |
| `H` / `L` | Jump to start / end of line |
| `J` / `K` (visual) | Move selection up/down |

## Updating everything at once

1. `:PackerSync` — update plugins
2. `:MasonUpdate` — update language servers
3. `:TSUpdate` — update Treesitter parsers
