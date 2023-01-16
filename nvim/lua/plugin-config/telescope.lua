local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("no telescope")
  return
end

telescope.setup({
  defaults = {
    initial_mode = "insert",
    mappings = require("keybindings").telescopeList,
  },
  pickers = {
    find_files = {
      -- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
       theme = "dropdown", 
    }
  },
  extensions = {
     -- 扩展插件配置
  },
})
