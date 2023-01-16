local status, bufferline = pcall(require, "bufferline")
if not status then
    vim.notify("no bufferline")
  return
end

bufferline.setup({
  options = {
    -- close tabs
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    --- nvim-tree sidebar
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
    diagnostics = "nvim_lsp",
    --- LSP diagnostics signs
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end,
  },
})
