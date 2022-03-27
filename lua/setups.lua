-- Setup nvim-cmp.
local cmp = require'cmp'
local luasnip = require("luasnip")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'path' },
    { name = 'buffer' },
    { name = 'treesitter' }
  }),

  formatting = {
    format = require("lspkind").cmp_format({with_text = true, menu = ({
      buffer = "[Buffer]",
      nvim_lsp = "[LSP]",
      luasnip = "[LuaSnip]",
      path = "[Path]",
      cmdline = "[Cmd]",
      treesitter = "[Treesitter]"
    })}),
  }
})


-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local nvim_lsp = require('lspconfig')


local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- general (no settings)
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, lsp in ipairs({'gopls', 'erlangls', 'elmls', 'jdtls', 'sumneko_lua'}) do
  nvim_lsp[lsp].setup {
    autostart = false;
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- npm shit (local server)
for _, lsp in ipairs({'eslint', 'tsserver'}) do
  nvim_lsp[lsp].setup {
    on_new_config = function(new_config, new_root_dir)
      local bin = new_config.cmd[1]
      if not string.find(bin, "node_modules") then
        new_config.cmd[1] = new_root_dir .. "/node_modules/.bin/" .. bin
      end
    end,
    autostart = false;
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

nvim_lsp['tailwindcss'].setup {
  on_new_config = function(new_config, new_root_dir)
    local bin = new_config.cmd[1]
    if not string.find(bin, "node_modules") then
      new_config.cmd[1] = new_root_dir .. "/node_modules/.bin/" .. bin
    end
  end,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    require("tailwindcss-colors").buf_attach(bufnr)
  end,
  autostart = false;
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  }
}

nvim_lsp['hls'].setup{
  autostart = false;
  -- root_dir = nvim_lsp.util.root_pattern("*default.nix"),
  settings = {
      haskell = {
          formattingProvider = "brittany"
      }
  },
  single_file_support = true,
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}


-- latex
nvim_lsp['texlab'].setup{
    cmd = { "texlab" },
    filetypes = { "tex", "bib" },
    --root_dir = function(fname)
    --      return util.root_pattern '.latexmkrc'(fname) or util.find_git_ancestor(fname)
    --   end,
    settings = {
      texlab = {
        auxDirectory = ".",
        bibtexFormatter = "texlab",
        build = {
          args = { "-pdfxe", "-interaction=nonstopmode", "-synctex=1", "%f" },
          executable = "latexmk",
          forwardSearchAfter = false,
          onSave = true
        },
        chktex = {
          onEdit = false,
          onOpenAndSave = true
        },
        diagnosticsDelay = 300,
        formatterLineLength = 80,
        forwardSearch = {
          args = {}
        },
        latexFormatter = "latexindent",
        latexindent = {
          modifyLineBreaks = false
        }
      }
    },
    single_file_support = true
}

-- godbolt

require("godbolt").setup({
    c = { compiler = "cg112", options = {} },
    cpp = { compiler = "g112", options = {} },
    rust = { compiler = "r1560", options = {} },
    haskell = { compiler = "ghc8105", options = {} },
    -- any_additional_filetype = { compiler = ..., options = ... },
    quickfix = {
        enable = enable, -- whether to populate the quickfix list in case of errors
        auto_open = enable -- whether to open the quickfix list if the compiler outputs errors
    }
})



--   nvim_lsp['jdtls'].setup{
--    cmd = { "/usr/lib/jvm/temurin-11-jdk-amd64/bin/java", "-Declipse.application=org.eclipse.jdt.ls.core.id1", "-Dosgi.bundles.defaultStartLevel=4", "-Declipse.product=org.eclipse.jdt.ls.core.product", "-Dlog.protocol=true", "-Dlog.level=ALL", "-Xms1g", "-Xmx2G", "--add-modules=ALL-SYSTEM", "--add-opens", "java.base/java.util=ALL-UNNAMED", "--add-opens", "java.base/java.lang=ALL-UNNAMED", "-jar", "/plugins/org.eclipse.equinox.launcher_*.jar", "-configuration", "config_linux", "-data", "/home/runner/workspace" },
--    filetypes = { "java" },
--    handlers = {
--      ["language/status"] = <function 1>,
--      ["textDocument/codeAction"] = <function 2>,
--      ["textDocument/rename"] = <function 3>,
--      ["workspace/applyEdit"] = <function 4>
--    },
--    init_options = {
--      jvm_args = {},
--      workspace = "/home/runner/workspace"
--    }
--    root_dir = {
--            -- Single-module projects
--            {
--              'build.xml', -- Ant
--              'pom.xml', -- Maven
--              'settings.gradle', -- Gradle
--              'settings.gradle.kts', -- Gradle
--            },
--            -- Multi-module projects
--            { 'build.gradle', 'build.gradle.kts' },
--          } or vim.fn.getcwd()
--    single_file_support = false
--}
