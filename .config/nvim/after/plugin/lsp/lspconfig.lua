-- ---------------------------------------------------------
-- i.   https://github.com/williamboman/mason.nvim
-- ii.  https://github.com/williamboman/mason-lspconfig.nvim
-- iii. https://github.com/neovim/nvim-lspconfig
-- ---------------------------------------------------------
-- https://github.com/josean-dev/dev-environment-files/blob/main/.config/nvim/lua/josean/plugins/lsp/lspconfig.lua
                                                    -- Binds
                                               -- _on_attach
local opts = { noremap = true, silent = true }
local _on_attach = function(client, bufnr)
    opts.buffer = bufnr

    opts.desc = "Show LSP references"
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

    opts.desc = "Go to declaration"
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    opts.desc = "Show LSP definitions"
    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

    opts.desc = "Show LSP implementations"
    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

    opts.desc = "Show LSP type definitions"
    vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

    opts.desc = "See available code actions"
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Rename"
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    opts.desc = "Show buffer diagnostics"
    vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

    opts.desc = "Show line diagnostics"
    vim.keymap.set("n", "<space>d", function() require("trouble").toggle("document_diagnostics") end)
    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)

    opts.desc = "Go to previous diagnostic"
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

    opts.desc = "Go to next diagnostic"
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

    opts.desc = "Show documentation for what is under cursor"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

    -- opts.desc = "Show type signature"
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

    -- vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

                           -- clangd_extensions inline hints
    -- require("clangd_extensions.inlay_hints").setup_autocmd()
    -- require("clangd_extensions.inlay_hints").set_inlay_hints()
end

-- ---------------------------------------------------------
                                            -- Servers setup
local lspconfig = require('lspconfig')
local default_capabilities = require('cmp_nvim_lsp').default_capabilities()


                                -- pyright , julia, marksman
local other_servers = { 'pyright', 'julials', 'marksman' }

for _, lsp in ipairs(other_servers) do
    lspconfig[lsp].setup({
        capabilities = default_capabilities,
        on_attach = _on_attach
    })
end
                                                   -- lua_ls
lspconfig['lua_ls'].setup({
    capabilities = default_capabilities,
    on_attach = _on_attach,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT'
            },
            diagnostics = {
                globals = { 'vim' }
            },
            workspace = {
                library = {
                    vim.env.VIMRUNTIME,
                }
            }
        }
    }
})
                                                   -- clangd
lspconfig['clangd'].setup({
    root_dir = function(fname)
        return require("lspconfig.util").root_pattern(
        "Makefile",
        "configure.ac",
        "configure.in",
        "config.h.in",
        "meson.build",
        "meson_options.txt",
        "build.ninja"
        )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
        fname
        ) or require("lspconfig.util").find_git_ancestor(fname)
    end,

    capabilities = {
        offsetEncoding = { "utf-16" },
    },

    on_attach = _on_attach,

    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
    },

    init_options = {
        usePlaceholders = true,
        completeUnimported = true,
        clangdFileStatus = true,
    },
})
                                                   -- texlab
lspconfig['texlab'].setup({
    capabilities = default_capabilities
})
                                                   -- bashls
lspconfig['bashls'].setup({
    capabilities = default_capabilities
})
                                           -- vim.diagnostic
vim.diagnostic.config({
    virtual_text = {
        prefix = '●', -- Could be '■', '▎', 'x'
    }
})
-- ----------------------------------------------------------------------------
-- -- Global mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
--
-- -- Use LspAttach autocommand to only map the following keys
-- -- after the language server attaches to the current buffer
-- vim.api.nvim_create_autocmd('LspAttach', {
--     group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--     callback = function(ev)
--         -- Enable completion triggered by <c-x><c-o>
--         -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
--
--         -- Buffer local mappings.
--         -- See `:help vim.lsp.*` for documentation on any of the below functions
--         local opts = { buffer = ev.buf }
--         vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--         -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--         vim.keymap.set('n', '<Bslash>gd', goto_definition('vsplit'), opts)
--         vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--         -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
--         -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
--         -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
--         -- vim.keymap.set('n', '<leader>wl', function()
--         --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--         -- end, opts)
--
--         vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
--         vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
--
--         -- vim.keymap.set('n', '<leader>D', builtin.lsp_type_definitions, opts)
--     end,
-- })
--
-- local t_builtin = require('telescope.builtin')
-- vim.keymap.set('n', 'gr', t_builtin.lsp_references)
-- vim.keymap.set('n', 'gI', t_builtin.lsp_implementations)
-- vim.keymap.set('n', '<leader>ds', t_builtin.lsp_document_symbols)
-- vim.keymap.set('n', '<leader>ws', t_builtin.lsp_dynamic_workspace_symbols)
