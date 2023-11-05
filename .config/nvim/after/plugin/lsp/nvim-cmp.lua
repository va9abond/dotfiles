-- ---------------------------------------------------------
                      -- https://github.com/hrsh7th/nvim-cmp
-- ---------------------------------------------------------
local cmp = require('cmp')
                                                  -- lspkind
local lspkind = require('lspkind')
                                                 -- Snippets
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
-- ---------------------------------------------------------
                                                  -- General
require('cmp').setup({
                                           -- Snippets setup
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
                                   -- Completion window view
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
                                                    -- Binds
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-u>'] = cmp.mapping.scroll_docs(4),
        ['<TAB>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({
            select = false,
            behavior = cmp.ConfirmBehavior.Replace
        }),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
                -- that way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
                                   -- Autocompletion sources
-- https://www.youtube.com/watch?v=1K1bNTOQi5g&list=PLOe6AggsTaVuIXZU4gxWJpIQNHMrDknfN&index=43
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip'  },
        { name = 'vimtex'   },
    }, {
        { name = 'buffer'   },
    }),
                                                  -- lspking
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symobl_text', -- text | symbol | text_symbol
            menu = {
                buffer        = "[Text]",
                path          = "[Path]",
                cmdline       = "[Cmd]",
                nvim_lsp      = "[LSP]",
                luasnip       = "[LuaSnip]",
                nvim_lua      = "[Lua]",
                vim_tex       = "[Vimtex]",
                latex_symbols = "[Latex]",
            },
            maxwidth = 30,
            ellipsis_char = "...",
        }),
    },
})

-- ---------------------------------------------------------
                     -- Set configuration for gitcommit file
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
         -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        { name = 'git' },
    }, {
        { name = 'buffer' },
    })
})
-- ---------------------------------------------------------
                        -- Use buffer source for `/` and `?`
  -- (if you enabled `native_menu`, this won't work anymore)
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})
-- ---------------------------------------------------------
                        -- Use cmdline & path source for ':'
                           -- (if you enabled `native_menu`,
                                 -- this won't work anymore)
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline({
        ['<CR>'] = cmp.mapping.confirm({ select = true })
    }),
    sources = cmp.config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline' }
    })
})
