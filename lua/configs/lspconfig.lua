-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

local servers = { "ts_ls", "tailwindcss", "html", "jsonls", "jdtls", "pyright", "prismals" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  if lsp ~= "jdtls" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
    }

    vim.diagnostic.config { virtual_text = false }
  end
end

-- CSS
lspconfig.cssls.setup {

  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "css" },
  settings = {
    css = { validate = true, lint = {
      unknownAtRules = "ignore",
    } },
    scss = { validate = true, lint = {
      unknownAtRules = "ignore",
    } },
    less = { validate = true, lint = {
      unknownAtRules = "ignore",
    } },
  },
}

-- Rust
lspconfig.rust_analyzer.setup {
  vim.diagnostic.config { virtual_text = false },
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "rust" },
  settings = {
    ["rust_analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}

-- eslint
lspconfig.eslint.setup {
  cmd = { "vscode-eslint-language-server", "--stdio" },
}

-- tailwind
lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,

  filetypes = {
    "typescriptreact",
    "javascriptreact",
    "javascript",
    "typescript",
    "html",
  },
}

-- typescript
-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
-- }
