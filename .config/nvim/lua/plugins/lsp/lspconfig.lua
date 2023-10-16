local lspconfig = require('lspconfig')
local default_capabilities = require('cmp_nvim_lsp').default_capabilities()


local servers = { 'pyright', 'julials' }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        -- on_attach = my_custom_on_attach,
        capabilities = default_capabilities,
    }
end

lspconfig['lua_ls'].setup {
    capabilities = default_capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    },
}

lspconfig['clangd'].setup {
    capabilities = default_capabilities,
    -- on_attach = function() end,
    -- filetypes = { 'c', 'cpp', 'cxx', 'h', 'hpp', 'hxx', 'objc', 'objcpp', 'cuda', 'proto' },
}

lspconfig['texlab'].setup {
    capabilities = default_capabilities
}

lspconfig['bashls'].setup {
    capabilities = default_capabilities
}

vim.diagnostic.config({
    virtual_text = {
        prefix = '●', -- Could be '■', '▎', 'x'
    }
})
-- ----------------------------------------------------------------------------
-- [NOTE]: use 'gp' instead for navigator.definition_preview
-- Go to definition in a split window
local function goto_definition(split_cmd)
    local util = vim.lsp.util
    local log = require("vim.lsp.log")
    local api = vim.api

    -- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
    local handler = function(_, result, ctx)
        if result == nil or vim.tbl_isempty(result) then
            local _ = log.info() and log.info(ctx.method, "No location found")
            return nil
        end

        if split_cmd then
            vim.cmd(split_cmd)
        end

        if vim.tbl_islist(result) then
            util.jump_to_location(result[1])

            if #result > 1 then
                util.set_qflist(util.locations_to_items(result))
                api.nvim_command("copen")
                api.nvim_command("wincmd p")
            end
        else
            util.jump_to_location(result)
        end
    end

    return handler
end

-- vim.lsp.handlers["textDocument/definition"] = goto_definition('vsplit')
-- ----------------------------------------------------------------------------
local builtin  = require('telescope.builtin')

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', '<Bslash>gd', goto_definition('vsplit'), opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
        -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<leader>wl', function()
        --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)

        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

        -- vim.keymap.set('n', '<leader>D', builtin.lsp_type_definitions, opts)
    end,
})

local t_builtin = require('telescope.builtin')
vim.keymap.set('n', 'gr', t_builtin.lsp_references)
vim.keymap.set('n', 'gI', t_builtin.lsp_implementations)
vim.keymap.set('n', '<leader>ds', t_builtin.lsp_document_symbols)
vim.keymap.set('n', '<leader>ws', t_builtin.lsp_dynamic_workspace_symbols)
