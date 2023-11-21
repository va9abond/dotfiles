-- ---------------------------------------------------------
                                            -- Custom colors
-- TODO: add custom colors as in gruvbox.lua
local _myblack = '#000000'
local _mygreen = '#114538'
local _mywhite = '#edede8'
-- ---------------------------------------------------------
require('rose-pine').setup({
    --- @usage 'auto'|'main'|'moon'|'dawn'
    variant = 'main',
    --- @usage 'main'|'moon'|'dawn'
    dark_variant = 'main',
    bold_vert_split = true,
    dim_nc_background = false,
    disable_background = false,
    disable_float_background = false,
    disable_italics = false,

    --- @usage string hex value or named color from rosepinetheme.com/palette
    groups = {
        background = _myblack,
        background_nc = 'nc',
        panel = 'surface',
        panel_nc = 'base',
        border = 'highlight_med',
        comment = 'muted',
        link = 'iris',
        punctuation = 'love',
        error = 'love',
        hint = 'iris',
        info = 'foam',
        warn = 'gold',
        git_add = 'foam',
        git_change = 'rose',
        git_delete = 'love',
        git_dirty = 'rose',
        git_ignore = 'muted',
        git_merge = 'iris',
        git_rename = 'pine',
        git_stage = 'iris',
        git_text = 'rose',
        headings = {
            h1 = 'iris',
            h2 = 'foam',
            h3 = 'rose',
            h4 = 'gold',
            h5 = 'pine',
            h6 = 'foam',
        },

        -- or set all headings at once
        -- headings = 'subtle'
    },

    -- Change specific vim highlight groups
    -- https://github.com/rose-pine/neovim/wiki/Recipes
    highlight_groups = {
        ColorColumn = { bg = 'overlay', blend = 10 },

        -- Blend colours against the "base" background
        CursorLine = { bg = 'overlay', blend = 20 },
        StatusLine = { fg = 'text', bg = _myblack },

        -- By default each group adds to the existing config.
        -- If you only want to set what is written in this config exactly,
        -- you can set the inherit option:
        Search = { bg = _mygreen, inherit = false },
    }
})
