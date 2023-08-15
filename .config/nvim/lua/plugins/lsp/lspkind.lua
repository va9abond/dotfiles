local lspkind = require('lspkind')
local cmp = require('cmp')

cmp.setup {
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text', -- show only symbol annotations (opt: text, symbol, text_symbol, symbol_text)
            menu = ({
                buffer =   "[Buffer]",
                nvim_lsp = "[LSP]"
            }),
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        })
    }
}
