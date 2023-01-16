local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("no nvim-tree")
  return
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local list_keys = require('keybindings').nvimTreeList
-- OR setup with some options
nvim_tree.setup({
    auto_reload_on_write = true,
    ignore_buffer_on_setup = true,
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list =list_keys
        },
        number = false,
        signcolumn = 'yes',
        hide_root_folder = false,
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
