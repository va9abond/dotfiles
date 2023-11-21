-- ---------------------------------------------------------
                      -- https://github.com/hrsh7th/nvim-cmp
                               -- Great Thanks to TJ DeVries
              -- https://www.youtube.com/watch?v=_DnmphIwnjo
-- ---------------------------------------------------------
                                                -- Pre setup
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Don't show the dumb matching stuff.
vim.opt.shortmess:append "c"
-- ---------------------------------------------------------
local cmp = require('cmp')
                                                  -- lspkind
local lspkind = require('lspkind')
                                                 -- Snippets
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
-- ---------------------------------------------------------
                                                  -- General
require('cmp').setup({
                                           -- Snippets setup
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    view = {
        entries = "custom", -- opts: custom / wildmenu / native
    },
                                   -- Completion window view
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
                                                    -- Binds
    mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        }),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
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
        { name = "nvim_lua", max_item_count = 13 },
        { name = "vimtex",   max_item_count = 5  },
        { name = "nvim_lsp", max_item_count = 5  },
        { name = "luasnip",  max_item_count = 8  },
        { name = "treesitter" },
    }, {
        { name = "path"     },
        { name = "buffer", max_item_count = 4, keyword_length = 4 },
    }),

    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,

            require("clangd_extensions.cmp_scores"),

            -- Thanks to TJ DeVries
            function(entry1, entry2)
                local _, entry1_under = entry1.completion_item.label:find "^_+"
                local _, entry2_under = entry2.completion_item.label:find "^_+"
                entry1_under = entry1_under or 0
                entry2_under = entry2_under or 0
                if entry1_under > entry2_under then
                    return false
                elseif entry1_under < entry2_under then
                    return true
                end
            end,

            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
                                                  -- lspking
    formatting = {
        format = lspkind.cmp_format({
            mode = 'text', -- text | symbol | text_symbol
            menu = {
                buffer        = "[Buf]",
                path          = "[Path]",
                cmdline       = "[Cmd]",
                nvim_lsp      = "[LSP]",
                luasnip       = "[Snip]",
                nvim_lua      = "[API]",
                vim_tex       = "[Vimtex]",
                latex_symbols = "[Latex]",
                treesitter    = "[TS]",
            },
            maxwidth = 25,
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
        { name = 'cmdline', max_item_count = 13 }
    })
})
