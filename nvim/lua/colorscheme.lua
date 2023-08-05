local colorscheme = "everforest" -- desert
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("Colorscheme " .. colorscheme .. " not found")
	return
end

vim.g.everforest_background = "soft"
vim.g.everforest_better_performance = 1
vim.g.everforest_transparent_background = 2
vim.g.everforest_sign_column_background = "grey"
vim.g.everforest_ui_contrast = "high"
vim.g.everforest_disable_terminal_colors = 1
