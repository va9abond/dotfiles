local npairs = require("nvim-autopairs")
local Rule = require('nvim-autopairs.rule')


npairs.setup ({
    disable_filetype = { "TelescopePrompt", "spectre_panel", "guihua", "guihua_rust", "clap_input", "vimwiki", "text" },
    disable_in_macro = true,  -- disable when recording or executing a macro
    disable_in_visualblock = true, -- disable when insert after visual block mode
    disable_in_replace_mode = true,
    ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
    enable_moveright = true,
    enable_afterquote = true,  -- add bracket pairs after quote
    enable_check_bracket_line = true,  --- check bracket in same line
    enable_bracket_in_quote = true,
    enable_abbr = false, -- trigger abbreviation
    break_undo = true, -- switch for basic rule break undo sequence
    map_cr = true,
    map_bs = true, -- map the <BS> key
    map_c_h = false,  -- Map the <C-h> key to delete a pair
    map_c_w = false, -- map <C-w> to delete a pair if possible

    check_ts = true,
    ts_config = {
        lua = { 'string' }, -- it will not add a pair on that treesitter node
    },
})

local ts_conds = require('nvim-autopairs.ts-conds')

-- press % => %% only while inside a comment or string
npairs.add_rules({
    Rule("%", "%", "lua")
        :with_pair(ts_conds.is_ts_node({ 'string', 'comment' })),
    Rule("$", "$", "lua")
        :with_pair(ts_conds.is_not_ts_node({ 'function' }))
})

-- latex
local cond = require('nvim-autopairs.conds')
print(vim.inspect(cond))

npairs.add_rules({
  Rule("$", "$",{"tex", "latex"})
    -- don't add a pair if the next character is %
    :with_pair(cond.not_after_regex("%%"))
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
