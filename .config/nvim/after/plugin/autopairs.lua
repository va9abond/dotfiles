-- ---------------------------------------------------------
                 -- https://github.com/windwp/nvim-autopairs
-- ---------------------------------------------------------
local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

npairs.setup ({
    disable_filetype = { "TelescopePrompt", "spectre_panel", "guihua", "guihua_rust", "clap_input", "vimwiki", "text" },
    -- map_cr = true,
    check_ts = true,
})

local ts_conds = require('nvim-autopairs.ts-conds')

-- ---------------------------------------------------------
      -- press % => %% only while inside a comment or string
npairs.add_rules({
    Rule("%", "%", "lua")
        :with_pair(ts_conds.is_ts_node({ 'string', 'comment' })),
    Rule("$", "$", "lua")
        :with_pair(ts_conds.is_not_ts_node({ 'function' }))
})

-- ---------------------------------------------------------
                                                    -- latex
local cond = require('nvim-autopairs.conds')

npairs.add_rules({
  Rule("$", "$",{"tex", "latex"})
    -- don't add a pair if the next character is %
    :with_pair(cond.not_after_regex("%%"))
    :with_pair(cond.not_after_regex("$$"))
    -- don't add a pair if  the previous character is xxx
    :with_pair(cond.not_before_regex("xxx", 3))
    -- don't move right when repeat character
    :with_move(cond.none())
    -- don't delete if the next character is xx
    :with_del(cond.not_after_regex("xx"))
    -- disable adding a newline when you press <cr>
    :with_cr(cond.none())
  },
  -- disable for .vim files, but it work for another filetypes
  Rule("a","a","-vim")
)

npairs.add_rules({
    Rule("$$","$$","tex")
    :with_pair(function(opts)
        print(vim.inspect(opts))
        if opts.line=="aa $$" then
            -- don't add pair on that line
            return false
        end
    end)
})
-- ---------------------------------------------------------
                           -- Connect nvim-cmp and autopairs
-- import nvim-autopairs completion functionality
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

-- import nvim-cmp plugin (completions plugin)
local cmp = require("cmp")

-- make autopairs and completion work together
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
