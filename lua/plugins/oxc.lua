-- OXC toolchain: oxlint (linter) + oxfmt (formatter)
-- Both run as LSP servers (oxlint --lsp / oxfmt --lsp).
-- oxlint and oxfmt are not yet in mason-lspconfig's auto-mapping, so we
-- declare them explicitly in astrolsp's servers list.

---@type LazySpec
return {

  -- Auto-install oxlint and oxfmt via Mason
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "oxlint",
        "oxfmt",
      })
    end,
  },

  -- Register the servers and configure formatting
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      -- Explicitly start oxlint and oxfmt (not in mason-lspconfig auto-mapping)
      servers = { "oxlint", "oxfmt" },

      config = {
        -- Enable all auto-fixable rules so :LspOxlintFixAll is maximally useful
        oxlint = {
          init_options = { settings = { fixKind = "all" } },
        },
      },

      formatting = {
        -- Prevent ts_ls / vtsls from competing with oxfmt for JS/TS formatting.
        -- They still handle hover, go-to-def, completions, etc.
        disabled = { "ts_ls", "vtsls" },

        format_on_save = {
          enabled = true,
          allow_filetypes = {
            "javascript", "javascriptreact",
            "typescript", "typescriptreact",
            "json", "jsonc",
            "yaml", "css", "scss", "less",
            "html", "markdown", "graphql", "vue",
          },
        },
      },
    },
  },
}
