lua << EOF

local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("no nvim-tree")
  return
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
nvim_tree.setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
    hide_root_folder = false,
    number = false,
    signcolumn = 'yes',
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
    custom = {'node_modules'},
  },
  git = {
      enable = false,
  },
})

EOF
