-- ---------------------------------------------------------
                 -- https://github.com/utilyre/barbecue.nvim
-- ---------------------------------------------------------
require('barbecue').setup({
    show_dirname = true,
    show_basename = false,
    exclude_filetypes = { "netrw", "toggleterm", "tex", "pdf", "txt", "text",
                            "wiki", "Trouble" },
})
